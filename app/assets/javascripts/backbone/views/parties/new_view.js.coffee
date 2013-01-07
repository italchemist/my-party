MyParty.Views.Parties ||= {}

class MyParty.Views.Parties.NewView extends Backbone.View
  template: JST["backbone/templates/parties/new"]

  events:
    "submit #new-party": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      wait: true
      success: (party) =>
        @model = party
        Backbone.history.navigate("/parties/#{@model.id}", true)

      error: (party, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
