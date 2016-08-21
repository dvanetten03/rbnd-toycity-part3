class Product
  # attr_reader :title, :price, :brand
  # attr_accessor :stock

  @@products = []

  def initialize(options={})
    # @title = options[:title]
    # @price = options[:price]
    # @brand = options[:brand]
    # @stock = options[:stock]
    @@products << self
  end

  def self.all
    @@products
  end

  # private

  # def add_to_products
  #   if @@products.map { |product| product.title}.include? @title
  #   @@products<<self
  #   else
  #     raise DuplicateProductError
  #   end
  # end
end