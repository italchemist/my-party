class MyParty.Routers.PartiesRouter extends Backbone.Router
  routes:
    "parties/new"      : "create"
    "parties/index"    : "index"
    "parties/:id/edit" : "edit"
    "parties/:id"      : "show"
    "parties"          : "index"
    ""                 : "index"

  initialize: (options) ->
    @parties = new MyParty.Collections.PartiesCollection()
    @parties = options.collection    
    @on("all", @change)

  change: (route, id) ->
    if id
      $("#menu-actions").show()
      $("#menu-activities-list").attr("href", "/parties/#{id}/activities")
      $("#menu-activities-new").attr("href", "/parties/#{id}/activities/new")
    else
      $("#menu-actions").hide()

  index: ->
    @view = new MyParty.Views.Parties.IndexView(parties: @parties)
    @render(@view, "#parties", true)

  show: (id) ->
    party = @parties.get(id)
    @view = new MyParty.Views.Parties.ShowView(model: party)
    @render(@view, "#party")

  create: ->
    @view = new MyParty.Views.Parties.NewView(collection: @parties)
    @render(@view, "#party")

  edit: (id) ->
    party = @parties.get(id)
    @view = new MyParty.Views.Parties.EditView(model: party)
    @render(@view, "#party")

  render: (view, target, skip = false) ->
    $(".container").hide()
    if (!(skip && $(target).html() != ""))
      $(target).html(view.render().el)
    $(target).show()