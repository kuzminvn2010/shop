require_relative "lib/product"
require_relative "lib/film"
require_relative "lib/book"
require_relative "lib/disc"
require_relative "lib/product_collection"
require_relative "lib/user_cart"

current_path = File.dirname(__FILE__)
collections = ProductCollection.from_dir(current_path)

collections.sort!(:by => :price, :order => :decrease)
# вывести все продукты в цикле
# спросить пользователя номер продукта
# купить продукт
# повторить
cart = UserCart.new
user_input = -1
loop do
  puts "Наши товары:\n\r"
  collections.to_a.each_with_index do |product, index|
    puts "#{index +1 } - #{product}"
  end
  puts "0 - Выход из магазина\n\r"
  puts "Что хотите купить?"
  user_input = STDIN.gets.to_i

  if (1..collections.to_a.size).include?(user_input)
    cart.add_product(collections.to_a[user_input - 1])
    collections.sell(user_input - 1)
  elsif user_input != 0
    puts "неправильный ввод"
  end
  break puts "Вы скупили весь магазин!" if collections.empty?
  abort("Жаль что Вы покидаете нас") if user_input == 0 && cart.empty?
  break puts "Спасибо за покупки! Приходите ещё!" if user_input == 0
end

# Выводим список всех покупок
puts "\nВы купили:\n\n"
cart.products.each do |product|
  puts "#{product.to_s_for_cart}"
end

# Выводим сумму всех покупок
puts "\nС Вас — #{cart.sum} руб."