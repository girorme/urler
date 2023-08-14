defmodule UrlerSvc.Http.Client do
  @moduledoc """
  Http wrapper
  """

  alias UrlerSvc.Http.Response

  def get(url, _opts) do
    IO.inspect(url)
    {:ok, response} = HTTPoison.get(url)

    {:ok,
     %Response{
       response: response.body,
       headers: response.headers
     }}
  end

  def get(url) do
    get(url, [])
  end
end
