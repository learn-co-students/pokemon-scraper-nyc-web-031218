require 'pry'

class Pokemon
  @@all = []
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @type = args[:type]
    @db = args[:db]
    @hp = args[:hp]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    # db.execute("IF COL_LENGTH('pokemon','hp') IS NULL BEGIN ALTER TABLE pokemon ADD hp INTEGER END")
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    binding.pry
  end


  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    # binding.pry
    Pokemon.new(id:pokemon[0][0], name:pokemon[0][1], type:pokemon[0][2], db:db)
  end

end
