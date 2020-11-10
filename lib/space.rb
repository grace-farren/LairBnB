require 'database_connection'
class Space
attr_reader :id, :name, :description, :price, :startdate, :enddate

  def initialize(id:, name:, description:, price:, startdate:, enddate:)
    @id = id
    @name = name
    @description = description
    @price = price
    @startdate = startdate
    @enddate = enddate
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces;")
    result.map do |lair|
      Space.new(id: lair['id'], name: lair['name'], description: lair['description'], price: lair['price'], startdate: lair['startdate'], enddate: lair['enddate'])
    end
  end

  def self.add(name)
    DatabaseConnection.query("INSERT INTO spaces (name) VALUES ('#{name}');")
  end

end
