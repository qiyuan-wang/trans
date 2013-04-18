@Trans.module "AnimatorApp", (AnimatorApp, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
  
  API =
    showAnimator: ->
      AnimatorApp.Show.Controller.showAnimator()
      
    startAnimate: ->
      
      
  AnimatorApp.on "start", ->
    API.showAnimator()
