require 'pry'

class Pokemon

	attr_accessor :id, :name, :type, :db, :hp

	def initialize(id:, name: ,type:, db:, hp:nil)
		@id = id
		@name = name
		@type = type
		@db = db
		@hp = hp
	end


def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
end



def self.find(id,db)
	x = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
	Pokemon.new(id:x[0], name:x[1], type:x[2], hp:x[3] ,db:db)
end

def alter_hp(new_hp,db)
	db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", new_hp, self.id)
end
	



end
