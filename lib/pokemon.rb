class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    info = db.execute("SELECT * FROM pokemon WHERE pokemon.id = id LIMIT 1").flatten
    Pokemon.new(id: info[0], name: info[1], type: info[2], db: db)
  end



end
