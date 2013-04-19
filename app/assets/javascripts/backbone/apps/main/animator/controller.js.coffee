@Trans.module "AnimatorApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =
    
    showAnimator: ->
      @animatorView = @getAnimatorView()
      App.animatorRegion.show @animatorView
      
    getAnimatorView: ->
      new Show.View