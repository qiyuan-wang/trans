@Trans.module "MainApp.Player", (Player, App, Backbone, Marionette, $, _) ->
  
  Player.Controller =
    showPlayer: ->
      playerView = @getPlayerView()
      App.mainRegion.show playerView
      
      @aud = playerView.getAud()
      @aud.setAttribute "src", "/assets/therobots.mp3"
      @aud.setAttribute "loop", true
      # @aud.load()
      console.log @aud

      playerView.on "play", =>
        @aud.play()
        
      playerView.on "pause", =>
        @aud.pause()
    
    getPlayerView: ->
      new Player.Layout