#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.MyParty =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: (party_id, activities, parties) ->
    @Collections.activities = {} 
    @Collections.activities[party_id] = new MyParty.Collections.ActivitiesCollection(activities, { party_id: party_id })
    @Collections.parties = new MyParty.Collections.PartiesCollection(parties)

    new MyParty.Routers.ActivitiesRouter {activities: @Collections.activities}
    new MyParty.Routers.PartiesRouter {collection: @Collections.parties}
    
    #@Collections.activities = new MyParty.Collections.ActivitiesCollection()
    #@Collections.parties    = new MyParty.Collections.PartiesCollection()
    #@Collections.activities.reset $("#activities").data("collection")
    #@Collections.parties.reset $("#parties").data("collection")

    
    
    
    #ar.preloaded(party_id, @Collections.activities)

    Backbone.history.start(pushState: true)

$(document).ready ->
  MyParty.initialize(
    $("#initial").data("party-id"),
    $("#activities").data("collection")
    $("#parties").data("collection")
  )