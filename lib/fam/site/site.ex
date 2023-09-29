defmodule Fam.Site do
  use Ash.Api

  resources do
    registry Fam.Site.Registry
  end
end
