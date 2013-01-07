MyParty.Views.Parties ||= {}

class MyParty.Views.Parties.PartyView extends Backbone.View
  template: JST["backbone/templates/parties/party"]

  events:
    "click .destroy" : "destroy"

  tagName: "li"
  className: "span4 relative"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
