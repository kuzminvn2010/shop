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

  let(:products) {product_collection.to_a}

  it 'checks product_collection some instance variables' do
    expect(products[0].title).to eq "Digital Distortion"
    expect(products[0].author).to eq "Iggy Azalea"
    expect(products[0].genre).to eq "Pop music"
  end

  it 'chooses products by price, order decrease' do
    expect { product_collection.sort!(:by => :price, :order => :decrease) }.to change { products[0].title }.from("Digital Distortion").to("Herzeleid")
  end

  it 'checks whether the array is empty or not' do
    expect(product_collection.empty?).to be_falsey
  end
end
