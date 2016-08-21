class Customer
  attr_reader :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.find {|c| c.name == name}
  end


  private

  def add_to_customers
    customer=self.class.find_by_name(@name)
    if customer
      raise DuplicateCustomerError, "'#{@name}' already exists!"
    else
      @@customers << self
    end
  end

end