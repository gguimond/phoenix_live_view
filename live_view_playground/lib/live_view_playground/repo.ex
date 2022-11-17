defmodule LiveViewPlayground.Repo do
  use Ecto.Repo,
    otp_app: :live_view_playground,
    adapter: Ecto.Adapters.Postgres
end
