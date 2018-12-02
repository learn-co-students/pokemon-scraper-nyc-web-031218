require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :hp, :db
  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = pokemon[:hp]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    pokemon_hash = {id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], hp: pokemon_array[3], db: db}
    yup = Pokemon.new(pokemon_hash)
  end

  def alter_hp(int, db)
    # binding.pry
    p_id = self.id
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", int, p_id)
  end
end

''
