require_relative "lib/product"
require_relative "lib/film"
require_relative "lib/book"
require_relative "lib/productcollection"

current_path = File.dirname(__FILE__)
collections = ProductCollection.from_dir(current_path)

puts collections.sort!(:by => :title).to_a















#film = Product.from_file("#{current_path}/data/films/01.txt")
#puts film
#begin
# Product.from_file("#{current_path}/data/films/*.txt")
#rescue NotImplementedError
#  puts "Метод 'from_file' у класса Product является статическим методом"
#end
