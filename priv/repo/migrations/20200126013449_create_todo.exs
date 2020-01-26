defmodule Hello.Repo.Migrations.CreateTodo do
  use Ecto.Migration

  def change do
      create table(:todos) do
        add :name, :string
        add :time, :integer
      end
  end
end
