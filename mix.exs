defmodule Alice.Mixfile do
  use Mix.Project

  def project do
    [app: :alice,
     version: "0.3.6",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: "A Slack bot",
     package: package,
     deps: deps,
     docs: [logo: "resources/logo.png"]
    ]
  end

  def application do
    [applications: [:logger, :slack, :mix]]
  end

  defp deps do
    [
      {:websocket_client, "~> 1.1.0"},
      {:credo,   ">= 0.0.0", only: [:dev, :test]},
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc,  ">= 0.0.0", only: :dev},
      {:slack,   "~> 0.9.1"},
      {:poolboy, "~> 1.5.0"},
      {:redix,   "~> 0.3.0"},
      {:poison,  "~> 2.1"}
    ]
  end

  defp package do
    [files: ["lib", "config", "mix.exs", "README*"],
     maintainers: ["Adam Zaninovich"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/adamzaninovich/alice",
              "Docs"   => "http://hexdocs.pm/alice/readme.html"}]
  end
end
