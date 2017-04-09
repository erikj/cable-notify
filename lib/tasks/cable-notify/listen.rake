namespace :cablenotify do |variable|

  desc 'listen to directory for file-system events'
  task :listen, [:watch_dir] => :environment do |t, args|

    listener = Listen.to(args.watch_dir) do |modified, added, removed|

      unless modified.empty?
        ac_broadcast eventType: :modified, files:modified, time:Time.now.to_i
      end

      unless added.empty?
        ac_broadcast eventType: :added, files:added, time:Time.now.to_i
      end

      unless removed.empty?
        ac_broadcast eventType: :removed, files:removed, time:Time.now.to_i
      end

    end

    listener.start
    salutation = "listening to #{args.watch_dir} @ #{Time.now}"
    puts salutation
    ac_broadcast eventType: :info, message:salutation
    sleep

  end
end

private

def ac_broadcast message
  ActionCable.server.broadcast 'inotify', message
end
