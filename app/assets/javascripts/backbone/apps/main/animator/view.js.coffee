@Trans.module "MainApp.Animator", (Animator, App, Backbone, Marionette, $, _) ->
  
  class Animator.View extends Marionette.ItemView
    template: "main/animator/templates/animator"
    ui:
      canvas: "canvas#animator"
    
    onRender: ->
      canvas = @getCanvas()
      context = canvas.getContext('2d')
      centerX = canvas.width / 2
      centerY = canvas.height / 2
      grd = context.createRadialGradient(centerX, centerY-100, 10, centerX, centerY+100, 400)
      grd.addColorStop(0, '#262E75')
      grd.addColorStop(0.46, '#1F2870')
      grd.addColorStop(1, '#181E56')
      context.fillStyle = grd
      context.fillRect(0, 0, canvas.width, canvas.height)
      
    getCanvas: ->
      @ui.canvas.get(0)