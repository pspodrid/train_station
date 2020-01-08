class City
  attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id).to_i
  end

  def ==(city_to_compare)
    self.name == city_to_compare.name()
  end

  def self.all
    db_cities = DB.exec("SELECT * FROM cities;")
    cities = []
    db_cities.each() do |city|
      name = city.fetch('name')
      id = city.fetch('id').to_i
      cities.push(City.new({:name => name, :id => id}))
    end
    cities
  end

  def self.find_by_id(id)
    city = DB.exec("SELECT * FROM cities WHERE id = #{id};").first
    if city
      name = city.fetch('name')
      id = city.fetch('id').to_i
      City.new({:name => name, :id => id})
    else
      nil
    end
  end

  def save
    db_cities = DB.exec("INSERT INTO cities (name) VALUES ('#{@name}') RETURNING id;")
    @id = db_cities.first().fetch('id').to_i
  end

  def update_name(name)
    @name = name
    DB.exec("UPDATE cities SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM cities WHERE id = #{@id};")
  end

end
