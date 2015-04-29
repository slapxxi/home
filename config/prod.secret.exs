use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :home, Home.Endpoint,
  secret_key_base: "Nlnwlejuudt3xxtezTafbvxepqOxPSvtJOHEEtCjpqFSnLagWDbT3Jm1O5MY6ren"

# Configure your database
config :home, Home.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "home_prod"
