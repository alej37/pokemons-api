# README

Installation Procedure:

 - gh repo clone alej37/pokemons-api
 - cd pokemons-api
 - bundle


Preparing the database:

  - rails db:migrate
  - rails db:seed


Run server:

  - rails s
  - http://localhost:3000/api/v1/pokemons?page=1 (URL for postman testing)


Testing:

  - rspec spec/api/controller/pokemons_controller_spec.rb

