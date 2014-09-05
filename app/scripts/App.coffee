define([
  "backbone"
  "routers/Router"
  ],
  (Backbone, Router)->
    App = (options)->
      if(@initialize && _.isFunction(@initialize))
        this.initialize(options)
      return

    App.prototype.initialize = (options)->
      _.each(options, (value, key)->
        @[key] = value

      ,this)

      @router = new Router({app:@})
      Backbone.history.start()

    _.extend(App.prototype, Backbone.Events)

    return App
)