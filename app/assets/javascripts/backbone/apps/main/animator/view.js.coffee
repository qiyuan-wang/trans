@Trans.module "MainApp.Animator", (Animator, App, Backbone, Marionette, $, _) ->
  
  class Animator.TransitionRegion extends Marionette.Region
    open: (view) ->
      @.$el.hide()
      @.$el.html view.el
      @.$el.show()
  
  
  class Animator.Stage extends Marionette.ItemView
    template: "main/animator/templates/stage"
    
    initialize: ->
      @robots = {}
      @texts = {}
    
    onShow: ->
      @draw = SVG('canvas').size(500, 500)
      robot_frame = ["robot1.svg", "robot2.svg", "robot3.svg", "robot4.svg"]
      text_frame = [
        {asset: "we.png", width: 126, height: 54},
        {asset: "are.png", width: 162, height: 54},
        {asset: "therobot.png", width: 500, height: 62}
      ]
      _.each _.range(4), (n) =>
        @robots[n] = @draw.nested().size(110, 220).attr({x: 130 * n, y:"20%"})
        _.each robot_frame, (frame) =>
          @robots[n].image("assets/" + frame, 110, 220).opacity(0)
      
      @screen = @draw.nested().size(500, 200).attr('y', "30%").back()
      _.each text_frame, (text, n) =>
        @screen.image("assets/" + text.asset, text.width, text.height).attr(x : n % 2 * 146 , y : Math.floor( n / 2) * 80).hide()
      
      
      App.target = @robots[0]
    
    clearCanvas: ->
      _.each @robots, (robot) ->
        robot.hide()
    
    resetRobots: ->
      _.each @robots, (robot) ->
        frames = robot.children()
        _.first(frames).opacity(1)
        _.each _.rest(frames), ((frame)-> frame.opacity(0))
    
    showRobots: (interval) ->
      _.each @robots, (robot, n) ->
        console.log n * interval
        setTimeout (-> robot.first().opacity(1)), n * interval
    
    showRobotsInRandom: (interval) ->
      _.each _.shuffle([0,1,2,3]), (i, n) =>
        frame = @robots[i].first()
        setTimeout (-> frame.opacity(1)), n * interval
    
    showRobotsInSlowMotion: (interval) ->
      _.each @robots, (robot, n) ->
        robot.first().animate({delay: n * interval}).opacity(1)
    
    showRobotsInSlowMotionInRandom: (interval)->
      _.each _.shuffle([0,1,2,3]), (i, n) =>
        @robots[i].first().animate({delay: n * interval}).opacity(1)
    
    hideRobots: (interval) ->
      _.each @robots, (robot, n) ->
        setTimeout (-> robot.first().opacity(0)), n * interval
    
    hideRobotsInRandom: (interval) ->
      _.each _.shuffle([0,1,2,3]), (i, n) =>
        frame = @robots[i].first()
        setTimeout (-> frame.opacity(0)), n * interval
    
    hideRobotsInSlowMotionInRandom: (interval) ->
      _.each _.shuffle([0,1,2,3]), (i, n) =>
        @robots[i].first().animate({delay: n * interval}).opacity(0)
    
    hideRobotsInSlowMotion: (interval) ->
      _.each @robots, (robot, n) ->
        robot.first().animate({delay: (3 - n) * interval}).opacity(0)
    
    robotsDownShouldersFromRightInSlowMotion: ->
      _.each @robots, (robot, n) ->
        base = robot.first()
        second = base.next()
        second.animate({milliseconds:1000, delay: (3 - n) * 1000}).opacity(0)
        base.animate({milliseconds:1000, delay: (3 - n) * 1000}).opacity(1)
        
    robotsRaiseShouldersFromLeftInSlowMotion: ->
      @resetRobots()
      _.each @robots, (robot, n) ->
        base = robot.first()
        second = base.next()
        base.animate({milliseconds:1000, delay: n * 1000}).opacity(0)
        second.animate({milliseconds:1000, delay: n * 1000}).opacity(1)
        
    robotsRaiseShouldersFromLeft: (interval) ->
      @resetRobots()
      _.each @robots, (robot, n) ->
        frame = robot.first()
        setTimeout (-> frame.opacity(0);frame.next().opacity(1)), n * interval
    
    robotsDownShouldersFromRight: (interval) ->
      _.each @robots, (robot, n) ->
        frame = robot.first()
        setTimeout (-> frame.opacity(1);frame.next().opacity(0)), (3 - n) * interval
        
      
      
    robotRaiseHandInSlowMotion: (n) ->
      @resetRobots()
      base = @robots[n].first()
      second = base.next()
      third = second.next()
      last = third.next()
      base.animate({milliseconds:1000, delay: 1000}).opacity(0)
      second.animate({milliseconds:1000, delay: 1000}).opacity(1).after ->
        this.animate(1000).opacity(0)
      third.animate({milliseconds:1000, delay: 2000}).opacity(1).after ->
        this.animate(1000).opacity(0)
      last.animate({milliseconds:1000, delay: 3000}).opacity(1)
      
    robotDropHandInSlowMotion: (n) ->
      base = @robots[n].first()
      second = base.next()
      third = second.next()
      last = third.next()
      if last.opacity() == 0
        last.opacity(1)
      last.animate({milliseconds:1000, delay: 1000}).opacity(0)
      third.animate({milliseconds:1000, delay: 1000}).opacity(1).after ->
        this.animate(1000).opacity(0)
      second.animate({milliseconds:1000, delay: 2000}).opacity(1).after ->
        this.animate(1000).opacity(0)
      base.animate({milliseconds:1000, delay: 3000} ).opacity(1)
    
    robotRaiseHand: (n, interval) ->
      @resetRobots()
      @robots[n].each (i, children)->
        frame = this
        if i < 3
          setTimeout (-> frame.opacity(0); frame.next().opacity(1)), (i + 1) * interval
      
    robotDropHand: (n, interval) ->
      last = @robots[n].children()[3]
      if last.opacity() == 0
        last.opacity(1)
      @robots[n].each (i, children)->
        frame = this
        if i > 0
          setTimeout (-> frame.opacity(0); frame.previous().opacity(1)), i * 3 % 4 * interval
        
    showTexts: ->
      @screen.each (i, children)->
        this.show()
    
    hideTexts: ->
      @screen.each (i, children)->
        this.hide()
    
    showTextsInLine: ->
      @screen.each (i, children)->
        image = this
        setTimeout (-> image.show()), 500 * i
        setTimeout (-> image.hide()), 3000
