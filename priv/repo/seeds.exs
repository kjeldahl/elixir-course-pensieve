# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pensieve.Repo.insert!(%Pensieve.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Pensieve.{Repo, Memories.Memory}

Repo.insert!(%Memory{
  title: "First day at Hogwarts",
  content: "Placed in Gryffindor by the sorting hat"
})

Repo.insert!(%Memory{title: "Quidditch tournament", content: "Gryffindor beat Slytherin 170-60"})
Repo.insert!(%Memory{title: "Triwizard Tournament"})

Repo.insert!(%Memory{
  title: "Went to Hogsmeade",
  content: "Drank Butterbeer at the Three Broomsticks"
})

Repo.insert!(%Memory{title: "Potions class"})
