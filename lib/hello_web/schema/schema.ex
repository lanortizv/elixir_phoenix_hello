defmodule HelloWeb.Schema do
#    use Absinthe.Schema
#    import_types HelloWeb.Schema.Types
#    query do
#        field :todo, list_of(:todos) do
#            resolve($Graphql.Blog)
    use Ecto.Schema
    schema "todo" do
        field :name, :string
        field :time, :integer
    end
end