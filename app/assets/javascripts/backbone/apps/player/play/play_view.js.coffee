@Trans.module "MainApp.Player", (Player, App, Backbone, Marionette, $, _) ->

  class Player.Layout extends Marionette.ItemView
    template: "player/play/templates/player"
    
    ui:{
      playButton: "#play > canvas"
      pauseButton: "#pause > canvas"
      aud: "#aud"
      playProgress: "#play-progress"
      loadProgress: "#load-progress"
      tips: "#tips"
    }
      
    triggers:
      "click #play"  : "play"
    
    onRender: ->
      canvas = @getCanvas()
      @drawPlayButton canvas
      @bindKeyboardEvent()
      
    drawPlayButton: (canvas) ->
      context = canvas.getContext('2d')
      context.clearRect(0, 0, canvas.width, canvas.height)
      context.lineWidth = 2
      context.strokeStyle = '#B61710'
      context.lineJoin = 'round'
      context.shadowColor = '#999'
      context.shadowBlur = 0
      context.beginPath()
      context.moveTo(11, 8)
      context.lineTo(11, 6)
      context.lineTo(23, 15)
      context.lineTo(11, 24)
      context.lineTo(11, 6)
      context.stroke()
      
    drawPauseButton: (canvas) ->
      context = canvas.getContext('2d')
      context.clearRect(0, 0, canvas.width, canvas.height)
      context.strokeStyle = '#B61710'
      context.lineJoin = 'round'
      context.shadowColor = '#999'
      context.shadowBlur = 0
      context.lineWidth = 2
      context.beginPath()
      context.moveTo(11, 7)
      context.lineTo(11, 23)
      context.stroke()
      context.beginPath()
      context.moveTo(17, 7)
      context.lineTo(17, 23)
      context.stroke()
    
    bindKeyboardEvent: ->
      $(document).keypress (evt) =>
        if evt.keyCode == 32
          @$("#play").trigger("click")
      
      
    getCanvas: ->
      @ui.playButton.get(0)
    
    getAud: ->
      @ui.aud.get(0)
    
    LoadBar: ->
      @ui.loadProgress
      
    PlayProgress: ->
      @ui.playProgress
    
    Tips: ->
      @ui.tips