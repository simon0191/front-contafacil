define([
  "backbone"
  "templates"
  ],
  (Backbone, templates)->
    HomeIndexView = Backbone.View.extend
      template: templates["home/index"]
      initialize: (options)->
        #TODO
        return
      render: ()->
        @$el.html(@template())
        return @

    return HomeIndexView
)