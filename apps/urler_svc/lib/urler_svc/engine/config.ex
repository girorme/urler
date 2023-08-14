defmodule UrlerSvc.Engine.Config do
  @moduledoc """
  Module used to control limits via guards
  """
  defmacro reached_bing_limit_page?(page) do
    quote do: unquote(page) > get_bing_page_limit!()
  end

  defmacro get_bing_page_limit!() do
    quote do: unquote(get_bing_page_limit_config())
  end

  def get_bing_page_limit_config() do
    case Application.get_env(:urler_svc, :bing_page_limit) do
      nil -> 20
      number -> String.to_integer(number)
    end
  end
end
