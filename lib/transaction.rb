class Transaction
  attr_reader :id, :customer, :product

  @@id = 1
  @@purchases = []

  def initialize(customer, product)
    @id = @@id
    @@id += 1
    @customer = customer
    @product = product
    add_transaction
  end

  def self.all
    @@purchases
  end

  def self.find(id)
    @@purchases.find {|t| t.id == id}
    if id == nil
      raise TransactionNotFoundError, "Transaction with id '#{id}' not found. Make sure you typed it in correctly."
    end
  end

  def purchase(product)
  end

  private

  def add_transaction
    if @product.stock <= 0
      raise OutOfStockError, "'#{@product.title}' is out of stock, please choose something else."
    else
      @product.stock -=1
      @@purchases << self
    end
  end
end
