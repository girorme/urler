defmodule UrlerSvc.Engine.Extractor do
  @moduledoc """
  Url extractor wrapper
  """

  def extract_urls(html_response) do
    Floki.parse_document!(html_response)
    |> Floki.find("a")
    |> Floki.attribute("href")
    |> return_only_abs_urls()
  end

  defp return_only_abs_urls(urls) do
    urls
    |> Enum.map(&URI.parse/1)
    |> Enum.reject(fn url -> url.scheme not in ["http", "https"] end)
    |> Enum.map(&URI.to_string/1)
    |> Enum.uniq()
  end
end
