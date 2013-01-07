MyParty.Views.Activities ||= {}

class MyParty.Views.Activities.IndexView extends Backbone.View
  template: JST["backbone/templates/activities/index"]

  initialize: () ->
    @options.activities.bind("reset", @addAll)
    @options.activities.on("add", @addOne)

  addAll: () =>
    @options.activities.each(@addOne)

  addOne: (activity) =>
    view = new MyParty.Views.Activities.ActivityView({model : activity})
    @$("#activities-table").append(view.render().el)

  itemOrderChanged: (e, ui) =>
    id = $("li", ui.item).data("id")
    index = ui.item.index()
    activity = MyParty.Collections.activities[@options.party_id].get(id)
    activity.set "order", index
    activity.save()

  render: =>
    @$el.html(@template(party_id: @options.party_id))
    @addAll()

    self = @
    $(".sortable", @$el).sortable
      handler: "li"
      update: (e, ui) -> self.itemOrderChanged(e, ui)

    return this