defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    #render(conn, "index.html")
    conn
    |>  put_flash(:info," Welcoe to Phoenix, from flash info!")
    |>  put_flash(:error, "Let's pretend we had an error.")
    #|>  put_layout(false)
    |>  render("index.html")
  end
end
