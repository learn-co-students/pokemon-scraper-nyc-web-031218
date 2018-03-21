require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(**options)
    options.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.create (pokestats, db)
    pokehash = {id: pokestats[0], name: pokestats[1], type: pokestats[2]}
    Pokemon.save(pokestats[1], pokestats[2], db)
    Pokemon.new(pokehash)
  end

  def self.find (id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    new_pokemon = Pokemon.create(result[0], db)
  end
end
