@Trans.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  
  class MainApp.Controller extends Marionette.Controller
    initialize: (options) ->
      @region = options.region
      
      @layout = @getLayoutView()
      
      @layout.on "show", =>
        playerController = @getPlayerController()
        playerController.showPlayer()
        
        App.reqres.setHandler "play:music", ->
          playerController.playMusic()
      
    
    showMainApp: ->
      @region.show @layout
    
    getLayoutView: ->
      new MainApp.Layout
      
    getPlayerController: ->
      new MainApp.Player.Controller
                            region: @layout.playerRegion
                  