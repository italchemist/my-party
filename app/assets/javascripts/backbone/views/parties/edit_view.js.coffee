MyParty.Views.Parties ||= {}

class MyParty.Views.Parties.EditView extends Backbone.View
  template: JST["backbone/templates/parties/edit"]

  events:
    "submit #edit-party": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (party) =>
        @model = party
        Backbone.history.navigate("/parties/#{@model.id}", true)
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
