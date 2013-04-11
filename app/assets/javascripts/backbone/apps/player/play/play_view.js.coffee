@Trans.module "MainApp.Player", (Player, App, Backbone, Marionette, $, _) ->

  class Player.Layout extends Marionette.ItemView
    template: "player/play/templates/player"
    
    ui:{
      playButton: "#play > canvas"
      pauseButton: "#pause > canvas"
      aud: "#aud"
    }
      
    triggers:
      "click #play"  : "play"
      "click #pause" : "pause"
    
    onRender: ->
      canvas = @ui.playButton.get(0)
      context = canvas.getContext('2d')
      context.beginPath()
      context.moveTo(6, 18)
      context.lineTo(6, 6)
      context.lineTo(18, 15)
      context.lineTo(6, 24)
      context.lineTo(6, 6)
      context.lineWidth = 2
      context.strokeStyle = '#B61710'
      context.lineJoin = 'round'
      context.shadowColor = '#999'
      context.shadowBlur = 0
      context.stroke()
      
      canvas = @ui.pauseButton.get(0)
      context = canvas.getContext('2d')
      context.strokeStyle = '#B61710'
      context.lineJoin = 'round'
      context.shadowColor = '#999'
      context.shadowBlur = 0
      context.lineWidth = 2
      context.beginPath()
      context.moveTo(11, 6)
      context.lineTo(11, 24)
      context.stroke()
      context.beginPath()
      context.moveTo(19, 6)
      context.lineTo(19, 24)
      context.stroke()
    
    getAud: ->
      @ui.aud.get(0)
        