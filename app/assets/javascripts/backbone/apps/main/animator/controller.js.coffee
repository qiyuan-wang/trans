@Trans.module "MainApp.Animator", (Animator, App, Backbone, Marionette, $, _) ->

  class Animator.Controller extends Marionette.Controller
    initialize: (options) ->
      @region = options.region
    
    showAnimator: ->
      @animatorView = @getAnimatorView()
      @region.show @animatorView
      
      
    getAnimatorView: ->
      new Animator.View