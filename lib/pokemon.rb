require 'pry'
class Pokemon

attr_accessor :name, :type, :db, :id

  def initialize (pokemon)
     @id = pokemon[:id]
     @name = pokemon[:name]
     @type = pokemon[:type]
     @db = pokemon[:db]
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?)
      SQL

      db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id=?
      SQL
      pokemon_info=db.execute(sql, id).flatten
      Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
  end

  def self.alter(hp=60)
    sql = <<-SQL
      INSERT INTO pokemon (hp) VALUES (?);
      SQL

      db.execute(sql, hp)
  end

end
