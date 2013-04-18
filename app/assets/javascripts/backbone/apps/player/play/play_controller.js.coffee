@Trans.module "PlayerApp.Play", (Play, App, Backbone, Marionette, $, _) ->
  
  Play.Controller =
    
    showPlayer: ->
      @playerView = @getPlayerView()
      App.playerRegion.show @playerView
      @canvas = @playerView.getCanvas()
      @aud = @playerView.getAud()
      @aud.setAttribute "src", "/assets/therobots.mp3"
      @aud.setAttribute "loop", true
      
      App.reqres.setHandler "play", =>
        @playMusic()
      
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
      
    playMusic: ->
      if @aud.paused
        @aud.play()
      else
        @aud.pause()
      
    getPlayerView: ->
      new Play.View
      