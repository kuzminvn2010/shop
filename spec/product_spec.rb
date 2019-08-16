require 'rspec'
require_relative '../lib/product'
require_relative '../lib/disc'

describe "Product" do
  file_path = File.dirname(__FILE__) + '/fixtures/1.txt'

  context 'check Product class methods' do
    it "matches the error message" do
      expect { Product.from_file(file_path) }.to raise_error(NotImplementedError)
    end
  end
end
