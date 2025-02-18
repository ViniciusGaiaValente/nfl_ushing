FROM bitwalker/alpine-elixir-phoenix:latest

WORKDIR /app

COPY mix.exs .
COPY mix.lock .
COPY rushing.json .

RUN mkdir assets

COPY assets/package.json assets
COPY assets/package-lock.json assets

CMD mix deps.get && mix ecto.setup && mix phx.server
