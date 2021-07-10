require "csv"


Pokemon.delete_all
puts "Destroying all pokemon!"
sleep(2)
puts "Gotta catch em all!"
sleep(3)


filepath = './db/pokemon.csv'
csv_options = { headers: :first_row}

CSV.foreach(filepath, csv_options) do |row|
  pokemon = Pokemon.new

  pokemon.name = row['Name']
  pokemon.type_one = row["Type 1"]
  pokemon.type_two = row["Type 2"]
  pokemon.total = row["Total"]
  pokemon.hp = row["HP"]
  pokemon.attack = row["Attack"]
  pokemon.defense = row["Defense"]
  pokemon.sp_attack = row["Sp. Atk"]
  pokemon.sp_defense = row["Sp. Def"]
  pokemon.speed = row["Speed"]
  pokemon.generation = row["Generation"]
  pokemon.legendary = row["Legendary"]

  if pokemon.save
    puts "You've caught: #{pokemon.name}!"
  else
    puts "Sorry, pokemon #{pokemon.name} has escaped, Report: #{pokemon.error.full_messages}"
  end
end


puts "You've caught em all!!"
