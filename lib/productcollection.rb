class ProductCollection

  def self.from_dir(current_path)
    products = []
    films_paths = Dir.glob("#{current_path}/data/films/*.txt")
    # записываем в массив  products все экземпляры класса Film
    films_paths.each do |file_path|
      products << Film.from_file(file_path)
    end

    books_paths = Dir.glob("#{current_path}/data/books/*.txt")
    books_paths.each do |file_path|
      products << Book.from_file(file_path)
    end

    disks_paths = Dir.glob("#{current_path}/data/discs/*.txt")
    disks_paths.each do |file_path|
      products << Disc.from_file(file_path)
    end

    self.new(products)
  end

  def initialize(products)
    @products = products
  end

  def to_a
    @products
  end

  def sort!(params)
    # Делает выбор по параметру by
    case params[:by]
      when :title
        # Если запросили сортировку по наименованию
        @products.sort_by! { |product| product.to_s }
      when :price
        # Если запросили сортировку по цене
        @products.sort_by! { |product| product.price }
      when :quantity
        # Если запросили сортировку по количеству
        @products.sort_by! { |product| product.quantity }
    end

    # Если запросили сортировку по убыванию
    @products.reverse! if params[:order] == :decrease

    # Возвращаем ссылку на экземпляр, чтобы у него по цепочке можно было вызвать
    # другие методы.
    self
  end
end