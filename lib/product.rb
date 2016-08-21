class Product
  attr_reader :title, :brand, :price
  attr_accessor :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @brand = options[:brand]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(title)
    @@products.find {|p| p.title == title}
  end

  def self.find_by_brand(brand)
    @@products.find {|p| p.brand == brand}
  end

  def in_stock?
    @stock >0
  end

  def self.in_stock
    @@products.select {|p| p.in_stock?}
  end


  private

  def low_stock
    if @stock <=20
      raise LowStockError, "'#{@title}' has less than 20 units left, you should reorder soon."
    end
  end

  def add_to_products
    product=self.class.find_by_title(@title)
    if product
      raise DuplicateProductError, "'#{@title}' already exists."
    else
      @@products << self
    end
  end
end