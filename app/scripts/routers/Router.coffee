define([
  "backbone"
  "views/home/HomeIndexView"
  ],
  (Backbone,HomeIndexView)->

    Router = Backbone.Router.extend
      initialize: (options)->
        @app = options.app

      routes:
        "":"home"

      home: ()->
        homeIndexView = new HomeIndexView()
        @app.$view.html(homeIndexView.render().$el)

    return Router
)