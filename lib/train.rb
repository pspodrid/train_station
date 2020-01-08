class Train
  attr_accessor :name, :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id).to_i
  end

  def ==(train_to_compare)
    self.name == train_to_compare.name()
  end

  def self.all
    db_trains = DB.exec("SELECT * FROM trains;")
    trains = []
    db_trains.each() do |train|
      name = train.fetch('name')
      id = train.fetch('id').to_i
      trains.push(Train.new(:name => name, :id => id))
    end
    trains
  end

  def self.find_by_id(id)
    train = DB.exec("SELECT * FROM trains WHERE id = #{id};").first
    if train
      name = train.fetch('name')
      id = train.fetch('id').to_i
      Train.new(:name => name, :id => id)
    else
      nil
    end
  end

  def save
    db_trains = DB.exec("INSERT INTO trains (name) VALUES ('#{@name}') RETURNING id;")
    @id = db_trains.first().fetch('id').to_i
  end

  def update_name(name)
    @name = name
    DB.exec("UPDATE trains SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM trains WHERE id = #{@id};")
  end

end
