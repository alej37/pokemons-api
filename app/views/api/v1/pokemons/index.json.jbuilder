json.array! @pokemons do |pokemon|
  json.extract! pokemon, 
  :id, 
  :name, 
  :type_one, 
  :type_two, 
  :total, 
  :hp, 
  :attack,
  :defense,
  :sp_attack,
  :sp_defense,
  :speed,
  :generation,
  :legendary
end
