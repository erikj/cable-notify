# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

cn = cn or {}
@cn = cn

$().ready ->
  cn.vueApp = new Vue
    el: '#vue-app'
    data:
      notifications: []
