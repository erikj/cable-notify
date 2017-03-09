namespace :cablenotify do |variable|

  task :listen, [:watch_dir] => :environment do |t, args|

    listener = Listen.to(args.watch_dir) do |modified, added, removed|
      messages = []
      unless modified.empty?
        messages << "modified: #{modified.inspect}"
      end
      unless added.empty?
        messages << "added: #{added.inspect}"
      end
      unless removed.empty?
        messages << "removed: #{removed.inspect}"
      end
      unless messages.empty?
        ActionCable.server.broadcast 'inotify', messages.join(", ")
      end
    end

    listener.start
    puts "listening to #{args.watch_dir}"
    sleep

  end
end
