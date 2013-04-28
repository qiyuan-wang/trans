@Trans.module "MainApp.Player", (Player, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
  class Player.Controller extends Marionette.Controller
    initialize: (options) ->
      @region = new Marionette.Region
                      el: options.region
      
      
    showPlayer: (audio) ->
      @playerView = @getPlayerView()
      @region.show @playerView
      
      # get audio ready
      @canvas = @playerView.getCanvas()
      @aud = @playerView.getAud()
      @aud.loop = true
      
      #choose the right source of the audio
      source = document.createElement('source')
      if @aud.canPlayType 'audio/mpeg'
        source.type = 'audio/mpeg'
        source.src = audio.mpegSrc
      else
        source.type = 'audio/ogg'
        source.src = audio.oggSrc
      
      @aud.appendChild source
      
      App.aud = @aud
      
      @playerView.on "play", =>
        @playerView.ui.frame.css("top", '65%')
        App.request "play:music"
          
          
      
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
      new Player.View

      