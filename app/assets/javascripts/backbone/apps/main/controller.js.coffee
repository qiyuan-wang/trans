@Trans.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  
  class MainApp.Controller extends Marionette.Controller
    initialize: (options) ->
      @region = options.region
      
      @layout = @getLayoutView()
      
      @layout.on "show", =>
        playerController = @getPlayerController()
        playerController.showPlayer App.audioResource
        
        animatorController = @getAnimatorController()
        animatorController.showAwaitScene()
        
        App.reqres.setHandler "play:music", ->
          playerController.playMusic()
          animatorController.playScenario1()
      
    
    showMainApp: ->
      @region.show @layout
    
    getLayoutView: ->
      new MainApp.Layout
      
    getPlayerController: ->
      new MainApp.Player.Controller
                            region: "#player-region"
    
    getAnimatorController: ->
      # console.log @layout.animateRegion
      new MainApp.Animator.Controller
                            region: "#animate-region"