require 'pry'

class Pokemon
  attr_accessor :name, :type, :hp, :id, :db
  # attr_reader
  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
    @hp = hash[:hp]
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?);
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ? LIMIT 1;
    SQL
    arr = db.execute(sql, id).flatten

    new_pokemon = {}
    new_pokemon[:id] = arr[0]
    new_pokemon[:name] = arr[1]
    new_pokemon[:type] = arr[2]
    new_pokemon[:hp] = arr[3]

    self.new(new_pokemon)
  end

  def alter_hp(hp, db)
    sql = <<-SQL
      UPDATE pokemon SET hp = ? WHERE id = ?;
    SQL

    hp_sql = <<-SQL
      SELECT hp FROM pokemon WHERE id = ? LIMIT 1;
    SQL

    db.execute(sql, hp, self.id)
    testthis = db.execute(hp_sql, self.id).flatten.first
    self.hp = testthis
    testthis
  end
end
