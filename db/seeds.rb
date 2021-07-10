require "csv"


Pokemon.delete_all
puts "Destroying all pokemon!"
sleep(2)
puts "Gotta catch em all!"
sleep(3)


filepath = './db/pokemon.csv'
csv_options = {headers: :first_row, header_converters: :symbol}

CSV.foreach(filepath, csv_options) do |row|
  pokemon = Pokemon.new

  pokemon.name = row[:name]
  pokemon.type_one = row[:type_one]
  pokemon.type_two = row[:type_two]
  pokemon.total = row[:total]
  pokemon.hp = row[:hp]
  pokemon.attack = row[:attack]
  pokemon.defense = row[:defense]
  pokemon.sp_attack = row[:sp_attack]
  pokemon.sp_defense = row[:sp_defense]
  pokemon.speed = row[:speed]
  pokemon.generation = row[:generation]
  pokemon.legendary = row[:legendary]

  if pokemon.save
    puts "You've caught: #{pokemon.name}!"
  else
    puts "Sorry, pokemon #{pokemon.name} has escaped, Report: #{pokemon.error.full_messages}"
  end
end


puts "You've caught em all!!"
