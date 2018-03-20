class Pokemon

  @@all = []
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(attributes) #name, ,type, db
    attributes.each {|key, value| self.send(("#{key}="), value)}
    #binding.pry
    #binding.pry
    #@hp = 60
    @@all << self
  end

  def self.save(name, type, db)
    #binding.pry
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.all
    @@all
  end

  def alter_hp(hp, db)
    #bob = db.execute("select * from pokemon where id = ?", self.id).flatten
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
    #binding.pry
    #self.hp = db.execute("select hp from pokemon where id = ?", self.id).flatten[0]
    #puts self.hp
    #self.hp
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    #binding.pry
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db, hp: pokemon[3])
  end

end
