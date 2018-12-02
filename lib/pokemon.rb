require "pry"

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
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    Pokemon.new(id:pokemon[0][0], name:pokemon[0][1], type:pokemon[0][2], hp:pokemon[0][3], db:db)
  end

  def alter_hp(new_hp, db)
    id = self.id

    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
  end

end
