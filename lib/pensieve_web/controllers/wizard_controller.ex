defmodule PensieveWeb.WizardController do
  use PensieveWeb, :controller

  alias Pensieve.Hogwarts
  alias Pensieve.Hogwarts.Wizard

  def index(conn, _params) do
    wizards = Hogwarts.list_wizards()
    render(conn, "index.html", wizards: wizards)
  end

  def new(conn, _params) do
    changeset = Hogwarts.change_wizard(%Wizard{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"wizard" => wizard_params}) do
    case Hogwarts.create_wizard(wizard_params) do
      {:ok, wizard} ->
        conn
        |> put_flash(:info, "Wizard created successfully.")
        |> redirect(to: Routes.wizard_path(conn, :show, wizard))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    wizard = Hogwarts.get_wizard!(id)
    render(conn, "show.html", wizard: wizard)
  end

  def edit(conn, %{"id" => id}) do
    wizard = Hogwarts.get_wizard!(id)
    changeset = Hogwarts.change_wizard(wizard)
    render(conn, "edit.html", wizard: wizard, changeset: changeset)
  end

  def update(conn, %{"id" => id, "wizard" => wizard_params}) do
    wizard = Hogwarts.get_wizard!(id)

    case Hogwarts.update_wizard(wizard, wizard_params) do
      {:ok, wizard} ->
        conn
        |> put_flash(:info, "Wizard updated successfully.")
        |> redirect(to: Routes.wizard_path(conn, :show, wizard))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", wizard: wizard, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    wizard = Hogwarts.get_wizard!(id)
    {:ok, _wizard} = Hogwarts.delete_wizard(wizard)

    conn
    |> put_flash(:info, "Wizard deleted successfully.")
    |> redirect(to: Routes.wizard_path(conn, :index))
  end
end
