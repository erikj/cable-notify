App.inotify = App.cable.subscriptions.create "InotifyChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    @appendToList eventType:'info', message:"we are connected"

  disconnected: ->
    # Called when the subscription has been terminated by the server
    @appendToList "we are disconnected"

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # console.log "received()"
    # console.log data
    @appendToList data

  appendToList: (data) ->
    # console.log data
    cn.vueApp.notifications.unshift data
