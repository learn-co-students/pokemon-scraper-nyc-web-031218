require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db, hp = nil)
  poke = Pokemon.new(id: id,
    name: db.execute("SELECT pokemon.name FROM pokemon WHERE id = #{id}").flatten[0], type: db.execute("SELECT pokemon.type FROM pokemon WHERE id = #{id}").flatten[0], hp: db.execute("SELECT pokemon.hp FROM pokemon WHERE id = #{id}").flatten[0], db: db
  )
  #binding.pry
end
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = #{hp} WHERE id = #{self.id}")
  #binding.pry
  end

end
