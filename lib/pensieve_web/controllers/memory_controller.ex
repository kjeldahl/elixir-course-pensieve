defmodule PensieveWeb.MemoryController do
  use PensieveWeb, :controller

  alias Pensieve.Memories
  alias Pensieve.Memories.Memory

  def new(conn, _params) do
    changeset = Memories.change_memory(%Memory{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"memory" => memory_params}) do
    case Memories.create_memory(memory_params) do
      {:ok, memory} ->
        conn
        |> put_flash(:info, "Create memory")
        |> redirect(to: Routes.memory_path(conn, :show, memory))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def index(conn, _params) do
    memories = Memories.list_memories()

    render(conn, "index.html", memories: memories)
  end

  def show(conn, %{"id" => id}) do
    memory = Memories.get_memory!(id)

    render(conn, "show.html", memory: memory)
  end
end
