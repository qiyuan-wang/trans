@Trans.module "PlayerApp", (PlayerApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
  
  API =
    showPlayer: ->
      PlayerApp.Play.Controller.showPlayer()
  
  # for test
  PlayerApp.Console =
    playMusic: ->
      PlayerApp.Play.Controller.playMusic()
      
  PlayerApp.on "start", ->
    API.showPlayer()
      