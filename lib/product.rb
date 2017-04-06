class Product
  attr_accessor :price, :quantity

  def initialize(param)
    @price = param[:price]
    @quantity =param[:quantity]
  end

  def to_s
    "#{@price} рублей  В наличии - #{@quantity}"
  end

  def self.from_file(file_path)
    NotImplementedError
  end
end
