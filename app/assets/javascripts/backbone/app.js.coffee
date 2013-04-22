@Trans = do (Backbone, Marionette) ->
  
  App = new Marionette.Application
  
  App.addRegions
    mainRegion: "#main-region"
    footerRegion: "#footer-region"
  
  App.addInitializer ->
    App.module("MainApp").start()
    App.module("FooterApp").start()
  
  App.on "initialize:after", ->
    if Backbone.history
      Backbone.history.start()
  
  App.audioResource = {
    oggSrc: "/assets/therobots.ogg",
    mpegSrc: "/assets/therobots.mp3",
    loop: true
    }
  
  App.state = "ready"
    
  App