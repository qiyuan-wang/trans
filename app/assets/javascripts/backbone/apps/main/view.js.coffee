@Trans.module "MainApp", (MainApp, App, Backbone, Marionette, $, _) ->
  
  class MainApp.Layout extends Marionette.Layout
    template: "main/templates/main"
    
    regions:
      playerRegion: "#player-region"
      animateRegion: "#animate-region"
      
    