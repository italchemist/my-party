MyParty.Views.Activities ||= {}

class MyParty.Views.Activities.NewView extends Backbone.View
  template: JST["backbone/templates/activities/new"]

  events:
    "submit #new-activity": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.set("party_id", options.party_id)

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      wait: true
      success: (activity) =>
        @model = activity
        Backbone.history.navigate("/parties/#{@options.party_id}/activities", true)

      error: (activity, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON()))
    @$("#new-activity").backboneLink(@model)
    return this
