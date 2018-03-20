require 'pry'

class Pokemon

  attr_accessor :name, :type, :id, :db, :hp

  def initialize(attributes)
    attributes.each {|key,value| self.send(("#{key}="), value)}
  end

  # def initialize(id:, name:, type:, db:, hp:)
  #   @id = id
  #   @name = name
  #   @type = type
  #   @hp = hp
  #   @db = db
  # end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)

  end

  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten

    Pokemon.new(id: result[0], name: result[1], type: result[2], hp: result[3], db: db)
  end

  # THIS IS THE CLASS METHOD VERSION
  # def self.alter_hp(id, new_hp, db)
  #   db.execute("UPDATE pokemon SET name = ? WHERE id = ?", new_hp, id)
  # end

  def alter_hp(new_hp, db)
  #  binding.pry
    @db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, @id)
    # @hp = Pokemon.find(@id, db).hp
    # self
    # Pokemon.new(id:)
    #Pokemon.new(id: result[0], name: result[1], type: result[2], db: db)
  end

end

#Pry.start

# database = SQLite3::Database.new("db/pokemon.db")

# pokemon = Pokemon.new(name: "XYZ", type: "water", db: database)
