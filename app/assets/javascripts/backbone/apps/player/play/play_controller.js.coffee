@Trans.module "MainApp.Player", (Player, App, Backbone, Marionette, $, _) ->
  
  Player.Controller =
    showPlayer: ->
      @playerView = @getPlayerView()
      App.mainRegion.show @playerView
      
      @aud = @playerView.getAud()
      @aud.setAttribute "src", "/assets/therobots.mp3"
      @aud.setAttribute "loop", true
      
      @playerView.on "play", =>
        canvas = @playerView.getCanvas()      
        if @aud.paused
          @aud.play()
          @playerView.ui.tips.fadeIn()
          @playerView.drawPauseButton canvas
        else
          @aud.pause()
          @playerView.drawPlayButton canvas
      
      @aud.addEventListener "timeupdate", =>
        width = parseInt(@playerView.ui.load_progress.css('width'))
        percentPlayed = Math.round(@aud.currentTime / @aud.duration * 100)
        barWidth = Math.ceil(percentPlayed * (width / 100))
        @playerView.ui.play_progress.css('width', barWidth)
  
    getPlayerView: ->
      new Player.Layout