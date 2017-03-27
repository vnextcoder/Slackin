# #Registry.match(MyRegistry, :_, :_) |> Enum.map(fn(x) -> Task.async(fn -> GenServer.call(x, foobar) end) end) |> Enum.map(fn(x) -> Task.await(x) end)
defmodule SlackinUmbrella.Mixfile do
  use Mix.Project

  def project do
    [apps_path: "apps",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps folder
  defp deps do
    [
      {:distillery, "~> 0.10.1"},
      {:timex, "~> 3.0"},
      {:mix_test_watch, "~> 0.3", only: :dev, runtime: false}
    ]
  end
end