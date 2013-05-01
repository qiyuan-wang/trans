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
        
        # to ensure all moves be triggered once and on time.
        must_run_1 = _.once (-> animatorController.showRobotsInSlowMotion())
        must_run_2 = _.once (-> animatorController.robotRaiseAndDropHandInSlowMotion 0)
        must_run_3 = _.once (-> animatorController.robotsRaiseAndDownShouldersFromLeftInSlowMotion())
        must_run_4 = _.once (-> animatorController.randomRobotRaiseAndDropHandSlowRepeated 2)
        must_run_5 = _.once (-> animatorController.randomRobotRaiseAndDropHandFastRepeated 4)
        must_run_6 = _.once (-> animatorController.robotsRaiseAndDownShouldersSlowRepeated 3)
        must_run_7 = _.once (-> animatorController.hideRobotsInSlowMotion true, 1000)
        must_run_8 = _.once (-> animatorController.textShownInLine 4)
        must_run_9 = _.once (-> animatorController.showRobots true, 500)
        must_run_10 = _.once (-> animatorController.hideRobots true, 500)
        must_run_11 = _.once (-> animatorController.textShownInLine 4)
        must_run_12 = _.once (-> animatorController.showRobots true, 1000)
        must_run_13 = _.once (-> animatorController.robotsRaiseAndDownShouldersFastRepeated 3)
        must_run_14 = _.once (-> animatorController.hideRobots true, 1000)
        must_run_15 = _.once (-> animatorController.textShownInLine 4)
        must_run_16 = _.once (-> animatorController.textShownInLine 4)
        must_run_17 = _.once (-> animatorController.showRobotsInSlowMotion())
        must_run_18 = _.once (-> animatorController.robotRaiseAndDropHandInSlowMotion 3)
        must_run_19 = _.once (-> animatorController.robotRaiseAndDropHandInSlowMotion 1)
        must_run_20 = _.once (-> animatorController.robotsRaiseAndDownShouldersFromLeftInSlowMotion())
        must_run_21 = _.once (-> animatorController.hideRobots false, 2000)
        must_run_22 = _.once (-> animatorController.showRobots true, 2000)
        must_run_23 = _.once (-> animatorController.randomRobotRaiseAndDropHandFastRepeated 30)
        must_run_24 = _.once (-> animatorController.hideRobots false, 1000)
        must_run_25 = _.once (-> animatorController.textShownInLine 4)
        must_run_26 = _.once (-> animatorController.showRobots true, 500)
        must_run_27 = _.once (-> animatorController.hideRobots true, 500)
        must_run_28 = _.once (-> animatorController.textShownInLine 4)
        must_run_29 = _.once (-> animatorController.textShown())
      
        aud.addEventListener "timeupdate", ->
          if aud.currentTime > 5.39 && aud.currentTime < 5.66
            must_run_1()
          if aud.currentTime > 11.931 && aud.currentTime < 12.26
            must_run_2()
          if aud.currentTime > 19.931 && aud.currentTime < 20.26
            must_run_3()
          if aud.currentTime > 27.931 && aud.currentTime < 38.26
            must_run_4()
          if aud.currentTime > 43.931 && aud.currentTime < 44.26
            must_run_5()
          if aud.currentTime > 59.931 && aud.currentTime < 60.26
            must_run_6()
          if aud.currentTime > 89.931 && aud.currentTime < 90.26
            must_run_7()
          if aud.currentTime > 95.931 && aud.currentTime < 96.26
            must_run_8()
          if aud.currentTime > 113.931 && aud.currentTime < 114.26
            must_run_9()
          if aud.currentTime > 117.931 && aud.currentTime < 118.26
            must_run_10()
          if aud.currentTime > 119.931 && aud.currentTime < 120.26
            must_run_11()
          if aud.currentTime > 135.931 && aud.currentTime < 136.26
            must_run_12()
          if aud.currentTime > 139.931 && aud.currentTime < 140.26
            must_run_13()
          if aud.currentTime > 161.931 && aud.currentTime < 162.26
            must_run_14()
          if aud.currentTime > 165.931 && aud.currentTime < 166.26
            must_run_15()
          if aud.currentTime > 189.931 && aud.currentTime < 190.26
            must_run_16()
          if aud.currentTime > 206.931 && aud.currentTime < 207.26
            must_run_17()
          if aud.currentTime > 219.931 && aud.currentTime < 220.26
            must_run_18()
          if aud.currentTime > 231.931 && aud.currentTime < 232.26
            must_run_19()
          if aud.currentTime > 239.931 && aud.currentTime < 240.26
            must_run_20()
          if aud.currentTime > 255.931 && aud.currentTime < 256.26
            must_run_21()
          if aud.currentTime > 267.931 && aud.currentTime < 268.26
            must_run_22()
          if aud.currentTime > 279.931 && aud.currentTime < 280.26
            must_run_23()
          if aud.currentTime > 419.931 && aud.currentTime < 420.26
            must_run_24()
          if aud.currentTime > 425.931 && aud.currentTime < 426.26
            must_run_25()
          if aud.currentTime > 441.931 && aud.currentTime < 442.26
            must_run_26()
          if aud.currentTime > 445.931 && aud.currentTime < 446.26
            must_run_27()
          if aud.currentTime > 449.931 && aud.currentTime < 450.26
            must_run_28()
          if aud.currentTime > 465.931 && aud.currentTime < 466.26
            must_run_29()

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
    