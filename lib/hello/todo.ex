defmodule Hello.Todo do
    use Ecto.Schema
    schema "todos" do
        field :name, :string
        field :time, :integer
    end
end