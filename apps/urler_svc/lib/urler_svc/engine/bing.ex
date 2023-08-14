defmodule UrlerSvc.Engine.Bing do
  @moduledoc """
  Bing search engine module
  """

  alias UrlerSvc.Http.{Client, Response}
  alias UrlerSvc.Engine.Extractor

  import UrlerSvc.Engine.Config

  def search_by_term(word), do: search(word, 1, [])

  def search(_word, page, urls_acc) when reached_bing_limit_page?(page), do: urls_acc

  def search(word, page, urls_acc) do
    IO.puts("[Bing] word: #{word} / page: #{page}")

    with {:ok, %Response{response: response}} <- Client.get(get_parsed_url(word, page)),
         {:ok, urls} <- extract_urls(response) do
      search(word, page + 1, urls ++ urls_acc)
    end
  end

  defp extract_urls(response) do
    urls = Extractor.extract_urls(response)
    {:ok, urls}
  end

  defp get_parsed_url(word, page) do
    with url <- get_url!() do
      format_url(url, word, page)
    end
  end

  defp get_url!(), do: Application.get_env(:urler_svc, :bing_url)

  defp format_url(url, word, page) do
    page = to_string(page)

    String.replace(url, ["{word}", "{page}"], fn word_to_replace ->
      case word_to_replace do
        "{word}" -> URI.encode(word)
        "{page}" -> page
      end
    end)
  end
end
