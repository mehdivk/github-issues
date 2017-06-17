defmodule CliTest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [ parse_args: 1 ]

  test "when provided with -h or --help, returns :help atom" do
    assert parse_args(["-h", "anything", "else"]) == :help
    assert parse_args(["--help", "anything", "else"]) == :help
  end

  test "when provided with user name, project name and issue count, returns them" do
    argv = ["elixir-lang", "elixir", "20"]

    result = parse_args(argv)

    assert result == { "elixir-lang", "elixir", 20 }
  end


  test "when not provided with issue count, uses 4 as number of issues" do
    argv = ["elixir-lang", "elixir"]

    { _, _, count } = parse_args(argv)

    assert count == 4
  end
end
