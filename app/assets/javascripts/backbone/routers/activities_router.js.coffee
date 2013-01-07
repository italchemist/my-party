class MyParty.Routers.ActivitiesRouter extends Backbone.Router
  routes:
    "parties/:party_id/activities/index"    : "index"    
    "parties/:party_id/activities/new"      : "create"
    "parties/:party_id/activities/:id/edit" : "edit"
    "parties/:party_id/activities/:id"      : "show"
    "parties/:party_id/activities"          : "index"

  initialize: (options) ->
    @activities = options.activities

  index: (party_id) ->
    @last_party_id = party_id unless @last_party_id?
    @view = new MyParty.Views.Activities.IndexView({activities: @collection(party_id), party_id: party_id})
    @render(@view, "#activities", () -> party_id != @last_party_id || $("#activities").html() == "")
    @last_party_id = party_id

  show: (party_id, id) ->
    activity = @collection(party_id, false).get(id)
    @view = new MyParty.Views.Activities.ShowView(model: activity)
    @render(@view, "#activity")

  create: (party_id) ->
    @view = new MyParty.Views.Activities.NewView({collection: @collection(party_id), party_id: party_id})
    @render(@view, "#activity")

  edit: (party_id, id) ->
    activity = @collection(party_id, false).get(id)
    @view = new MyParty.Views.Activities.EditView(model: activity)
    @render(@view, "#activity")

  collection: (party_id, async = true) ->
    collection = @activities[party_id]
    unless collection?
      $(".loading").show()
      collection = new MyParty.Collections.ActivitiesCollection(null, { party_id: party_id })
      @activities[party_id] = collection
      collection.fetch({ async: async })
    return collection

  render: (view, target, render = true) ->
    $(".container").hide()
    $(target).html(view.render().el) if render
    $(target).show()