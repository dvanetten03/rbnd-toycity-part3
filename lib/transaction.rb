class Transaction
  attr_reader :id, :customer, :product

  @@id = 1
  @@transactions = []

  def initialize(customer, product)
    @@id += 1
    @customer = customer
    @product = product
    add_transaction
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.find {|i| i.id == id}
  end

  private

  def add_transaction
    if @product.stock <= 0
      raise OutOfStockError, "'#{@product.title}' is out of stock, please choose something else."
    else
      @product.stock -=1
      @@transactions << self
    end
  end
end