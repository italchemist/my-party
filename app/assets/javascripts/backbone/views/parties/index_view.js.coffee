MyParty.Views.Parties ||= {}

class MyParty.Views.Parties.IndexView extends Backbone.View
  template: JST["backbone/templates/parties/index"]

  initialize: () ->
    @options.parties.bind("reset", @addAll)
    @options.parties.on("add", @addOne)

  addAll: () =>
    @options.parties.each(@addOne)

  addOne: (party) =>
    view = new MyParty.Views.Parties.PartyView({model : party})
    @$("#parties-table").append(view.render().el)

  render: =>
    @$el.html(@template(parties: @options.parties.toJSON() ))
    @addAll()

    return this
