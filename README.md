# Midnight Murder Party
Elm + Phoenix

Requires
- [Elm](http://elm-lang.org/install) v0.16.0
- [Elixir](http://elixir-lang.org/install.html) v1.2.0
- [Phoenix](http://www.phoenixframework.org/docs/installation) v1.1.1
- [Postgres](http://www.postgresql.org/download/) v9.4.5
- [Node.js/NPM](https://nodejs.org/en/) v4.2.4

Setup
- Install above requirements
- Clone repository
- cd into repository
- `npm install`
- `mix deps.get`
- Make sure you have Postgress running
- `mix ecto.create`
- `mix ecto.migrate`
- `mix run priv/repo/seeds.exs`
- `cd web/elm && elm package install -y && cd ../../`
- `mix phoenix.server`

Compiling Elm
- cd into web/elm
    + Compile Editor: `elm make Editor/Editor.elm --output=../static/vendor/editor.js`
    + Compile Reader: `elm make Reader/Reader.elm --output=../static/vendor/reader.js`
