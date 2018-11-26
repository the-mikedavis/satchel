defmodule Satchel.MixProject do
  use Mix.Project

  def project do
    [
      app: :satchel,
      version: "0.1.1",
      elixir: "~> 1.4",
      start_permanent: Mix.env() == :prod,
      deps: [
        {:ex_doc, "0.19.1"}
      ],
      name: "Satchel",
      source_url: "https://github.com/the-mikedavis/satchel.git",
      description: "A (de)serializer for Elixir types",
      package: package()
    ]
  end

  def application, do: [extra_applications: []]

  defp package do
    [
      name: "satchel",
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE),
      licenses: ["BSD3"],
      links: %{"GitHub" => "https://github.com/the-mikedavis/satchel.git"}
    ]
  end
end
