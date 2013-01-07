MyParty.Views.Activities ||= {}

class MyParty.Views.Activities.ActivityView extends Backbone.View
  template: JST["backbone/templates/activities/activity"]

  events:
    "click .destroy": "destroy"

  initialize: ->
    @model.bind("change", @render)

  destroy: () ->
    @model.destroy()
    this.remove()
    return false

  render: =>
    @$el.html(@template(@model.toJSON()))
    return this