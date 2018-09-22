defmodule Satchel.MixProject do
  use Mix.Project

  def project do
    [
      app: :satchel,
      version: "0.1.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env() == :prod,
      deps: []
    ]
  end

  def application, do: [extra_applications: []]
end
