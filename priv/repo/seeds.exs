# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CampusPolice.Repo.insert!(%CampusPolice.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias CampusPolice.Types.Type
alias CampusPolice.Repo

Repo.insert(%Type{name: "murder"})
Repo.insert(%Type{name: "robbery"})
