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
        animatorController.showStage()
        
        App.reqres.setHandler "play:music", ->
          
          playerController.playMusic()
        
        must_run_1 = _.once (-> animatorController.showRobotsInSlowMotion())
        must_run_2 = _.once (-> animatorController.textShownInLine 4)
        aud.addEventListener "timeupdate", ->
          if aud.currentTime > 5.39 && aud.currentTime < 5.56
            must_run_1()
          if aud.currentTime > 11.931 && aud.currentTime < 12.16
            animatorController.robotRaiseAndDropHandInSlowMotion 0
          if aud.currentTime > 19.931 && aud.currentTime < 20.16
            animatorController.robotsRaiseAndDownShouldersFromLeftInSlowMotion()
          if aud.currentTime > 27.931 && aud.currentTime < 28.16
            animatorController.robotRaiseAndDropHandSlow 2
          if aud.currentTime > 41.431 && aud.currentTime < 41.66
            animatorController.robotsRaiseAndDownShouldersFastRepeated 6
          if aud.currentTime > 65.431 && aud.currentTime < 65.66
            animatorController.randomRobotRaiseAndDropHandFastRepeated 6
          if aud.currentTime > 89.931 && aud.currentTime < 90.16
            animatorController.hideRobotsInSlowMotion true, 1000
          if aud.currentTime > 96.931 && aud.currentTime < 97.36
            must_run_2()
          if aud.currentTime > 113.931 && aud.currentTime < 114.16
            animatorController.showRobots true, 500
          if aud.currentTime > 117.931 && aud.currentTime < 118.16
            animatorController.hideRobots true, 500
          if aud.currentTime > 119.931 && aud.currentTime < 120.16
            animatorController.textShownInLine 4
          if aud.currentTime > 135.931 && aud.currentTime < 136.16
            animatorController.showRobots true, 1000
          if aud.currentTime > 151.931 && aud.currentTime < 152.16
            animatorController.robotsRaiseAndDownShouldersFastRepeated 2
          if aud.currentTime > 161.931 && aud.currentTime < 162.16
            animatorController.hideRobots true, 1000
          if aud.currentTime > 167.931 && aud.currentTime < 168.16
            animatorController.textShownInLine 4
          if aud.currentTime > 191.931 && aud.currentTime < 192.16
            animatorController.textShownInLine 4
          if aud.currentTime > 206.931 && aud.currentTime < 207.16
            animatorController.showRobotsInSlowMotion()
          if aud.currentTime > 206.931 && aud.currentTime < 207.16
            animatorController.resetRobots()
          if aud.currentTime > 396.931 && aud.currentTime < 397.16
            animatorController.robotsRaiseAndDownShouldersFastRepeated 6
          if aud.currentTime > 419.931 && aud.currentTime < 420.16
            animatorController.hideRobots false, 1000
          if aud.currentTime > 426.931 && aud.currentTime < 427.16
            animatorController.textShownInLine 4
          if aud.currentTime > 443.931 && aud.currentTime < 444.16
            animatorController.showRobots true, 500
          if aud.currentTime > 447.931 && aud.currentTime < 448.16
            animatorController.hideRobots true, 500
          if aud.currentTime > 450.931 && aud.currentTime < 451.16
            animatorController.textShownInLine 4
          if aud.currentTime > 465.931 && aud.currentTime < 466.16
            animatorController.textShown()
          if aud.currentTime > 527.931 && aud.currentTime < 529.16
            animatorController.textHidden()

    showMainApp: ->
      @region.show @layout
    
    getLayoutView: ->
      new MainApp.Layout
      
    getPlayerController: ->
      new MainApp.Player.Controller
                            region: "#player-region"
    
    getAnimatorController: ->
      new MainApp.Animator.Controller
                            region: "#animate-region"
    