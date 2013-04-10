@Trans.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
  
  API =
    showPlayer: ->
      MainApp.Player.Controller.showPlayer()
      
  MainApp.on "start", ->
    API.showPlayer()
      