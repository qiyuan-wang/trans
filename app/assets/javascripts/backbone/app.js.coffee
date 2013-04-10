@Trans = do (Backbone, Marionette) ->
  
  App = new Marionette.Application
  
  App.addRegions
    mainRegion: "#main-region"
    footerRegion: "#footer-region"
  
  App.addInitializer ->
    App.module("FooterApp").start()
    App.module("MainApp").start()
  
  App.on "initialize:after", ->
    if Backbone.history
      Backbone.history.start()
  
  App