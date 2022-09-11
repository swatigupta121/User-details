defmodule ListDev.Repo do
  use Ecto.Repo,
    otp_app: :list_dev,
    adapter: Ecto.Adapters.Postgres
end
