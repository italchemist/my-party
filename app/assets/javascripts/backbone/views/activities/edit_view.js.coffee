MyParty.Views.Activities ||= {}

class MyParty.Views.Activities.EditView extends Backbone.View
  template: JST["backbone/templates/activities/edit"]

  events:
    "submit #edit-activity": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (activity) =>
        @model = activity
        party_id = @model.get('party_id')
        Backbone.history.navigate("/parties/#{party_id}/activities", true)
    )

  render: ->
    @$el.html(@template(@model.toJSON()))
    @$("#edit-activity").backboneLink(@model)
    return this
