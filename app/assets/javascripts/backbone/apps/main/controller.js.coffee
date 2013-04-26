@Trans.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  
  class MainApp.Controller extends Marionette.Controller
    initialize: (options) ->
      @region = options.region
      
      @layout = @getLayoutView()
      
      @layout.on "show", =>
        playerController = @getPlayerController()
        playerController.showPlayer App.audioResource
        
        aud = playerController.aud
        animatorController = @getAnimatorController()
        animatorController.showAwaitScene()
        
        App.reqres.setHandler "play:music", ->
          playerController.playMusic()
          animatorController.playScenario1()
          animatorController.robotTestMove()
          
        aud.addEventListener "timeupdate", ->
          console.log aud.currentTime
          if aud.currentTime > 5.29 && aud.currentTime < 5.54
            console.log "show" + aud.currentTime
            # animatorController.showRobots()
          if aud.currentTime > 16.08 && aud.currentTime < 16.37
            console.log "hand" + aud.currentTime
            # animatorController.robotRaiseHand 0
                          
          
      
    
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