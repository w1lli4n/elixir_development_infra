#./lib/supa_dupa_test/router.ex
defmodule SupaDupaTest.Router do
  use Plug.Router

  plug(Plug.Logger)

  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Hello, world!")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end

