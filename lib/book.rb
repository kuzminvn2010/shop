require_relative "to_s"
class Book < Product
  attr_accessor :title, :type, :author

  def self.from_file(file_path)
    if File.exist?(file_path)
      # переменной strings присваиваем весь файл в виде массива строк
      strings = File.readlines(file_path).map { |string| string.chomp }

      self.new(
        :title => strings[0],
        :type => strings[1],
        :author => strings[2],
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
    @type = param[:type]
    @author = param[:author]
  end

  include To_s

  def to_s_for_cart
    "Книга #{@title}, #{@type}, автор - #{@author}"
  end
end
