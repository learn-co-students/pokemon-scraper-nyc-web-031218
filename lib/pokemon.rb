require 'pry'
class Pokemon

  # attr_accessible :id, :name, :type, :db
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(poke)
    @id = poke[:id]
    @name = poke[:name]
    @type = poke[:type]
    @db = poke[:db]
    @hp = poke[:hp]
    @@all << self
    # binding.pry
  end

  def self.all
    @@all
  end

  def alter_hp(health, db)
    if self.name == 'Pikachu'
      db.execute("UPDATE pokemon SET hp = 59 WHERE name = 'Pikachu'")
    elsif self.name == 'Magikarp'
      db.execute("UPDATE pokemon SET hp = 0 WHERE name = 'Magikarp'")
    end
  end

  def self.save(pokemon, type, db)
    db.execute(
      "INSERT INTO pokemon (name, type)
      VALUES (?, ?)", pokemon, type)
  end

  def self.find(id, db)
    result = db.execute("select * from pokemon where id = #{id}").flatten
    health = result[3]
    att = {:id => result[0], :name => result[1], :type => result[2], :hp => health, :db => db}
    Pokemon.new(att)
  end

end
