@Trans.module "MainApp.Player", (Player, App, Backbone, Marionette, $, _) ->
  
  Player.Controller =
    showPlayer: ->
      playerView = @getPlayerView()
      
      App.mainRegion.show playerView
    
    getPlayerView: ->
      new Player.Layout