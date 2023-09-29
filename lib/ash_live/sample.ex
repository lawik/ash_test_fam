defmodule Fam.Site.Post.Admin do
  use Ash.UI,
    flavor: AshUI.Flavor.LiveView

  resource Fam.Site.Post
  layout("app.html.heex")

  get "/" do
    name :index
    view_action(:read)
    # Action will have "get?" true if it is a single
    # Will have type: :read if it is a read-view
    attributes([:title, :content])
    # default []
    general_routes([:new])
    default_route(:view)
    item_route([:update])
    batch_actions([:destroy])
  end

  form "/" do
    name :new
    view_action(:create)
    # Attributes default to whatever the
  end

  get "/:id" do
    name :view
    view_action(:by_id)
    attributes([:title, :content])
    per_actions([:update, :delete])
  end
end
