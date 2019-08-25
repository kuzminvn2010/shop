require 'rspec'

require_relative '../lib/product_collection'
require_relative '../lib/product'
require_relative '../lib/disc'

describe 'Product collection initialize' do
  let(:product_collection) do
    current_path = File.dirname(__FILE__)
    dir_path = current_path + '/fixtures'
    product_collection = ProductCollection.from_dir(dir_path)
  end

  it 'checks product_collection some instance variables' do
    expect(product_collection.to_a[0].title).to eq "Painkiller"
    expect(product_collection.to_a[0].author).to eq "Judas Priest"
    expect(product_collection.to_a[0].genre).to eq "Heavy Metal"
  end
end
