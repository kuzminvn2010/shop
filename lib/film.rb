require_relative "to_s"
class Film < Product
  attr_accessor :title, :director, :year

  def self.from_file(file_path)
    if File.exist?(file_path)
      # переменной strings присваиваем весь файл в виде массива строк
      strings = File.readlines(file_path).map { |string| string.chomp }

      self.new(
        :title => strings[0],
        :director => strings[1],
        :year => strings[2].to_i,
        :price => strings[3].to_i,
        :quantity => strings[4].to_i
      )
    else
      abort "Файл не найден!"
    end
  end

  def initialize(param)
    super
    @title = param[:title]
    @director = param[:director]
    @year = param[:year]
  end

  include To_s

  def to_s_for_cart
     "Фильм #{@title}, #{@year}, реж. #{@director}"
  end
end
