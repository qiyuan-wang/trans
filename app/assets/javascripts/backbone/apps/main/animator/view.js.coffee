@Trans.module "MainApp.Animator", (Animator, App, Backbone, Marionette, $, _) ->
  
  class Animator.TransitionRegion extends Marionette.Region
    open: (view) ->
      @.$el.hide()
      @.$el.html view.el
      @.$el.show()
  
  class Animator.AwaitScene extends Marionette.ItemView
    template: "main/animator/templates/await_scene"
    ui:
      canvas: "canvas#animator"
    
    onRender: ->
      canvas = @getCanvas()
      context = canvas.getContext('2d')
      centerX = canvas.width / 2
      centerY = canvas.height / 2
      grd = context.createRadialGradient(centerX, centerY-100, 10, centerX, centerY, 600)
      grd.addColorStop(0, '#262E75')
      grd.addColorStop(0.25, '#1F2870')
      grd.addColorStop(1, '#181E56')
      context.fillStyle = grd
      context.fillRect(0, 0, canvas.width, canvas.height)
      
      
    getCanvas: ->
      @ui.canvas.get(0)
  
  
  class Animator.Scenario1 extends Marionette.ItemView
    template: "main/animator/templates/scenario_1"
    
    initialize: ->
      @robots = {}
      @draw = {}
    
    createCanvas: ->
      @draw = SVG('canvas').size(500, 714)
      robot_frame = ["robot1.svg", "robot2.svg", "robot3.svg", "robot4.svg"]
      _.each _.range(4), (n)=>
        @robots[n] = @draw.nested().size(110, 220).attr({x: 130 * n, y:"18%"})
        _.each robot_frame, (frame)=>
          @robots[n].image("assets/" + frame, 110, 220).opacity(0)
      App.target = @robots[0]

    showRobots: ->
      _.each @robots, (robot, n) ->
        robot.first().animate({delay: n * 1000}).opacity(1)
    
    resetRobots: ->
      _.each @robots, (robot) ->
        frames = robot.children()
        _.first(frames).opacity(1)
        _.each _.rest(frames), ((frame)-> frame.opacity(0))
    
    hideRobotsInRandom: ->
      _.each _.shuffle([0,1,2,3]), (i, n) =>
        console.log "it's " + i
        @robots[i].first().animate({delay: n * 1000}).opacity(0)
    
    hideRobots: ->
      _.each @robots, (robot, n) ->
        robot.first().animate({delay: (3 - n) * 1000}).opacity(0)
    
    robotsDownShouldersInLineFromRight: ->
      console.log "here"
      _.each @robots, (robot, n) ->
        base = robot.first()
        second = base.next()
        second.animate({milliseconds:1000, delay: (3 - n) * 1000}).opacity(0)
        base.animate({milliseconds:1000, delay: (3 - n) * 1000}).opacity(1)
        
    
    robotsRaiseShouldersInLineFromLeft: ->
      @resetRobots()
      _.each @robots, (robot, n) ->
        base = robot.first()
        second = base.next()
        base.animate({milliseconds:1000, delay: n * 1000}).opacity(0)
        second.animate({milliseconds:1000, delay: n * 1000}).opacity(1)
      setTimeout (=> @robotsDownShouldersInLineFromRight()), 4000
      
    robotDropHand: (n) ->
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
      
    
    robotRaiseHand: (n) ->
      base = @robots[n].first()
      second = base.next()
      third = second.next()
      last = third.next()
      if base.opacity() == 0
        base.opacity(1)
      base.animate({milliseconds:1000, delay: 1000}).opacity(0)
      second.animate({milliseconds:1000, delay: 1000}).opacity(1).after ->
        this.animate(1000).opacity(0)
      third.animate({milliseconds:1000, delay: 2000}).opacity(1).after ->
        this.animate(1000).opacity(0)
      last.animate({milliseconds:1000, delay: 3000}).opacity(1).after =>
        @robotDropHand n
      

      #   
      # third.animate({delay: 5000}).opacity(1).after ->
      #   this.animate().opacity(0)
      # second.animate({delay: 6000}).opacity(1).after ->
      #   this.animate().opacity(0)
      # base.animate({delay: 7000}).opacity(1)
      
      # framePipeline = (array) ->
      #   _.bindAll array
      #   if _.first(array) != undefined
      #     _.first(array).children()[0].opa