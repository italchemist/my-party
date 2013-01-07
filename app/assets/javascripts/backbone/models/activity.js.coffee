class MyParty.Models.Activity extends Backbone.Model
  paramRoot: "activity"

  defaults:
    name: null
    description: null
    duration: null
    order: 0
    party_id: null

class MyParty.Collections.ActivitiesCollection extends Backbone.Collection
  model: MyParty.Models.Activity
  url: -> "/api/parties/#{@party_id}/activities"

  initialize: (models, options) ->
    @party_id = options.party_id