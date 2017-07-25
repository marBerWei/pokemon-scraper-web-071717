
class Pokemon

	attr_accessor :type, :db, :id, :name


	def initialize(args)
		@name = args[:name] 
		@type = args[:type]
		@db = args[:db]
		@id = args [:id]
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO Pokemon (name, type) VALUES (?,?)", name, type)
	end

	def self.find(id,db)
		obj = db.execute("SELECT * FROM pokemon WHERE id =?", id)
		flattened_obj = obj.flatten
		poke_hash = {name: flattened_obj[1],type: flattened_obj[2], id: flattened_obj[0]}
		new_poke = Pokemon.new(poke_hash)
	end

end