@Trans.module "MainApp.Player", (Player, App, Backbone, Marionette, $, _) ->
  
  Player.Controller =
    showPlayer: ->
      @playerView = @getPlayerView()
      App.mainRegion.show @playerView
      @canvas = @playerView.getCanvas()
      @aud = @playerView.getAud()
      @aud.setAttribute "src", "/assets/therobots.mp3"
      @aud.setAttribute "loop", true
      
      @playerView.on "play", =>
        if @aud.paused
          @aud.play()
        else
          @aud.pause()
      
      @aud.addEventListener "timeupdate", =>
        width = parseInt(@playerView.LoadBar().css('width'))
        percentPlayed = Math.round(@aud.currentTime / @aud.duration * 100)
        barWidth = Math.ceil(percentPlayed * (width / 100))
        @playerView.PlayProgress().css('width', barWidth)
      
      @aud.addEventListener "play", =>
        @playerView.Tips().fadeIn()
        @playerView.drawPauseButton @canvas
      
      @aud.addEventListener "pause", =>
        @playerView.drawPlayButton @canvas
  
    getPlayerView: ->
      new Player.Layout