@Trans = do (Backbone, Marionette) ->
  
  App = new Marionette.Application
  
  App.addRegions
    animatorRegion: "#animate-region"
    playerRegion: "#player-region"
    footerRegion: "#footer-region"
  
  App.addInitializer ->
    App.module("PlayerApp").start()
    App.module("AnimatorApp").start()
    App.module("FooterApp").start()
  
  App.on "initialize:after", ->
    if Backbone.history
      Backbone.history.start()
  
  App