defmodule PensieveWeb.MemoryController do
  use PensieveWeb, :controller

  alias Pensieve.Repo
  alias Pensieve.Memories.Memory

  def index(conn, _params) do
    memories = Repo.all(Memory)

    render(conn, "index.html", memories: memories)
  end

  def show(conn, %{"id" => id}) do
    memory = Repo.get!(Memory, id)

    render(conn, "show.html", memory: memory)
  end
end
