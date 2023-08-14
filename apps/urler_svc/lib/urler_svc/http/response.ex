defmodule UrlerSvc.Http.Response do
  @moduledoc """
  High level interface to simplify http responses
  """
  defstruct [:response, :headers]
end
