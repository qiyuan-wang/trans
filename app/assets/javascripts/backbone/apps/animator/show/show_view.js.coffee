@Trans.module "AnimatorApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  
  class Show.View extends Marionette.ItemView
    template: "animator/show/templates/animator_show"