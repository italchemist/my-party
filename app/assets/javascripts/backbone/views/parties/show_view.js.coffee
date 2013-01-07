MyParty.Views.Parties ||= {}

class MyParty.Views.Parties.ShowView extends Backbone.View
  template: JST["backbone/templates/parties/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
