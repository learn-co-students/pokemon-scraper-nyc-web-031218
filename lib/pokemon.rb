require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
    @@all << self

  end

  def self.all
    @@all

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type)
    VALUES (?, ?)", name, type)

  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM Pokemon WHERE id = #{id}")
    Pokemon.new({id: pokemon[0][0], name: pokemon[0][1], type: pokemon[0][2]})
  end


end

# binding.pry

puts "a"
