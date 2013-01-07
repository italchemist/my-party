class MyParty.Models.Party extends Backbone.Model
  paramRoot: 'party'

  defaults:
    name: null
    description: null
    start_at: null
    end_at: null
    location: null

class MyParty.Collections.PartiesCollection extends Backbone.Collection
  model: MyParty.Models.Party
  url: '/api/parties'
