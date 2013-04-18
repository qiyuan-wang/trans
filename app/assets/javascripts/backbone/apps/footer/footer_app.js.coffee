@Trans.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
  
  @startWithParent = false
  
  API =
    showFooter: ->
      controller = new FooterApp.Controller 
                                region: App.footerRegion
      controller.showFooter()
      
  FooterApp.on "start", ->
     API.showFooter()