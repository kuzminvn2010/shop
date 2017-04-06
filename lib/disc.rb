require_relative "to_s"
class Disc < Product
  attr_accessor :title, :genre, :author, :year

  def self.from_file(file_path)
    if File.exist?(file_path)
      # переменной strings присваиваем весь файл в виде массива строк
      strings = File.readlines(file_path).map { |string| string.chomp }

      self.new(
        :title => strings[0],
        :author => strings[1],
        :genre => strings[2],
        :year => strings[3].to_i,
        :price => strings[4].to_i,
        :quantity => strings[5].to_i
      )
    else
      abort "Файл не найден!"
    end
  end

  def initialize(param)
    super
    @title = param[:title]
    @genre = param[:genre]
    @author = param[:author]
    @year = param[:year]
  end

  include To_s

  def to_s_for_cart
    "Диск <#{@title}> - #{@author},  #{@genre}, #{@year} года"
  end
end
