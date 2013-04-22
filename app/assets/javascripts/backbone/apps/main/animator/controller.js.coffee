@Trans.module "MainApp.Animator", (Animator, App, Backbone, Marionette, $, _) ->

  class Animator.Controller extends Marionette.Controller
    initialize: ->
      @region = new Animator.TransitionRegion
                      el: "#animate-region"
    
    showAwaitScene: ->
      @animatorView = @getwAwaitScene()
      @region.show @animatorView
      
    playScenario1: ->
      @scenario_1 = @getScenario1()
      @region.show @scenario_1
    
    getwAwaitScene: ->
      new Animator.AwaitScene
      
    getScenario1: ->
      new Animator.Scenario1