class Pokemon

  attr_accessor :name, :type, :db, :id
  # attr_reader

  def initialize(hash)
    # bindi/ng.pry
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
    @id = hash[:id]
    @hp = hash[:hp]
  end

  def self.save(name, type, db)
    # binding.pry
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)

  end

  def self.find(id, db)
    # binding.pry
    # new_hash= {}
    poke = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    new_pokemon = Pokemon.new({id: poke[0], name: poke[1], type: poke[2], db: db})
  end

  def self.hp_alter(new_hp, db)
    # binding.pry
    db.execute("UPDATE pokemon set hp = 60", new_hp)
    # binding.pry
  end

end
