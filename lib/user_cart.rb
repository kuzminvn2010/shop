require_relative "empty"
class UserCart
  attr_reader :products, :sum, :user_deals

  def initialize
    @products = []
    @sum = 0
  end

  def successful_add(product)
    puts "\nВы выбрали: #{(product.to_s_for_cart)}\n\n"
  end

  def cart_sum(product)
    @sum += product.price
    puts "У Вас в корзине товаров на сумму: #{@sum} руб.\n\n"
  end

  def add_product(product)
    product.quantity -=1
    @products.push(product)
    successful_add(product)
    cart_sum(product)
    if product.quantity == 0
      puts "Этот товар раскуплен.\n\n"
    end
  end

  include Empty
end

