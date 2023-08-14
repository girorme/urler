defmodule UrlerSvc do
  @moduledoc """
  Urler Api to search engines
  """

  alias UrlerSvc.Engine.Bing

  def bing_search(term) do
    Bing.search_by_term(term)
  end
end
