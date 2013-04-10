@Trans.module "MainApp.Player", (Player, App, Backbone, Marionette, $, _) ->

  class Player.Layout extends Marionette.ItemView
    template: "player/play/templates/player"
    
    onRender: ->
      