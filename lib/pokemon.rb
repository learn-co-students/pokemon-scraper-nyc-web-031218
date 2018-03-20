require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id)
    @id = id[:id]
    @name = id[:name]
    @type = id[:type]
    @hp = id[:hp]
    @db = id[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)

    name = pokemon[0][1]
    type = pokemon[0][2]
    hp = pokemon[0][3]

    Pokemon.new({id: id, name: name, type: type, hp: hp, db: db})
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
  end
end
