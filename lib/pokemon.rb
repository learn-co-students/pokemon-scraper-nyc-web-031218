require 'pry'

class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = 60
    @@all << self
    pokemon
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?,?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    ans = Pokemon.new(id:pokemon[0][0], name:pokemon[0][1], type:pokemon[0][2], db:db)
    ans
  end

  def self.alter_hp

  end
end
