@Trans.module "MainApp.Animator", (Animator, App, Backbone, Marionette, $, _) ->
  @startWithParent = false
  class Animator.Controller extends Marionette.Controller
    initialize: ->
      @region = new Animator.TransitionRegion
                      el: "#animate-region"
      @intId = {}
      
    showStage: ->
      @stage = @getStage()
      @region.show @stage
    
    resetRobots: ->
      @stage.resetRobots()
    
    showRobots: (option = false, interval = 1000) ->
      if option == false
        @stage.showRobots interval
      else
        @stage.showRobotsInRandom interval
    
    showRobotsInSlowMotion: (option = false, interval = 1000) ->
      if option == false
        @stage.showRobotsInSlowMotion interval
      else
        @stage.showRobotsInSlowMotionInRandom interval
    
      
    hideRobots: (option = false, interval = 1000) ->
      @stage.resetRobots()
      if option == false
        @stage.hideRobots interval
      else
        @stage.hideRobotsInRandom interval
    
    hideRobotsInSlowMotion: (option = false, interval = 1000) ->
      @stage.resetRobots()
      if option == false
        @stage.hideRobotsInSlowMotion interval
      else
        @stage.hideRobotsInSlowMotionInRandom interval
      
    
    # consume 8s
    robotRaiseAndDropHandInSlowMotion: (n) ->
      @stage.robotRaiseHandInSlowMotion n
      setTimeout (=> @stage.robotDropHandInSlowMotion n), 4000
      
    
    # consume 8s
    robotsRaiseAndDownShouldersFromLeftInSlowMotion: ->
      @stage.robotsRaiseShouldersFromLeftInSlowMotion()
      setTimeout (=> @stage.robotsDownShouldersFromRightInSlowMotion()), 4000
    
    # consume 4s
    robotsRaiseAndDownShouldersFromLeftFast: ->
      @stage.robotsRaiseShouldersFromLeft 500
      setTimeout (=> @stage.robotsDownShouldersFromRight 500), 2000
      
      # consume 8s
    robotsRaiseAndDownShouldersFromLeftSlow: ->
      @stage.robotsRaiseShouldersFromLeft 1000
      setTimeout (=> @stage.robotsDownShouldersFromRight 1000), 4000
      
    # consume 4s
    robotRaiseAndDropHandFast: ->
      n = _.random(0, 3)
      @stage.robotRaiseHand n, 500
      setTimeout (=> @stage.robotDropHand n, 500), 2000
    
    # consume 8s
    robotRaiseAndDropHandSlow: (n = 0)->
      if n == 0
        n = _.random(0, 3)
      @stage.robotRaiseHand n, 1000
      setTimeout (=> @stage.robotDropHand n, 1000), 4000
      
    # each time 4s
    robotsRaiseAndDownShouldersFastRepeated: ( n = 0)->
      @robotsRaiseAndDownShouldersFromLeftFast()
      if n != 0
        _(n).times (i) =>
          if i > 0
            setTimeout (=> @robotsRaiseAndDownShouldersFromLeftFast()), i * 4000
      else
        @intId = setInterval (=> @robotsRaiseAndDownShouldersFromLeftFast()), 4000
      
    # each time 8s
    robotsRaiseAndDownShouldersSlowRepeated: (n = 0)->
      @robotsRaiseAndDownShouldersFromLeftSlow()
      if n != 0
        _(n).times (i) =>
          if i > 0
            setTimeout (=> @robotsRaiseAndDownShouldersFromLeftSlow()), i * 8000
      else
        @intId = setInterval (=> @robotsRaiseAndDownShouldersFromLeftSlow()), 8000
    
    #each time 4s
    randomRobotRaiseAndDropHandFastRepeated: (n = 0)->
      @robotRaiseAndDropHandFast()
      if n != 0
        _(n).times (i) =>
          if i > 0
            setTimeout (=> @robotRaiseAndDropHandFast()), i * 4000
      else
        @intId = setInterval (=> @robotRaiseAndDropHandFast()), 4000
    
    #each time 8
    randomRobotRaiseAndDropHandSlowRepeated: (n = 0)->
      @robotRaiseAndDropHandSlow()
      if n != 0
        _(n).times (i) =>
          if i > 0
            setTimeout (=> @robotRaiseAndDropHandSlow()), i * 8000
      else
        App.intId = @intId = setInterval (=> @robotRaiseAndDropHandSlow()), 8000
    
    cancelRepeat: ->
      if @intId != undefined
        clearInterval @intId
    
    #each time 4s
    textShownInLine: (n)->
      @stage.showTextsInLine()
      if n != 0
        _(n).times (i) =>
          if i > 0
            setTimeout (=> @stage.showTextsInLine()), i * 4000
    
    textShown: ->
      @stage.showTexts()
      
    textHidden: ->
       @stage.hideTexts()
    getStage: ->
      new Animator.Stage