require_relative "lib/product"
require_relative "lib/film"
require_relative "lib/book"

current_path = File.dirname(__FILE__)

films_paths = Dir.glob("#{current_path}/data/films/*.txt").sort!
films = []
# записываем в массив  clothes все экземпляры класса ClothesItem
films_paths.each do |file_path|
  films << Film.from_file(file_path)
end
puts "Фильмы:\n"
films.each do |film|
  puts film.to_s
end
puts

books_paths = Dir.glob("#{current_path}/data/books/*.txt").sort!
books = []
# записываем в массив  clothes все экземпляры класса ClothesItem
books_paths.each do |file_path|
  books << Book.from_file(file_path)
end
puts "Книги:\n"
books.each do |book|
  puts book.to_s
end


#film = Product.from_file("#{current_path}/data/films/01.txt")
#puts film
#begin
# Product.from_file("#{current_path}/data/films/*.txt")
#rescue NotImplementedError
#  puts "Метод 'from_file' у класса Product является статическим методом"
#end
