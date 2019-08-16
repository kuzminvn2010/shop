require 'rspec'
require_relative '../lib/product'
require_relative '../lib/disc'

describe 'Disc' do
  file_path = File.dirname(__FILE__) + '/fixtures/1.txt'
  disc = Disc.from_file(file_path)

  context 'disc methods' do
    it "check disc init attributes" do
       expect(disc).to have_attributes(title: 'Painkiller')
       expect(disc).to have_attributes(author: 'Judas Priest')
       expect(disc).to have_attributes(genre: 'Heavy Metal')
       expect(disc).to have_attributes(year: '1990'.to_i )
       expect(disc).to have_attributes(price: '990'.to_i )
       expect(disc).to have_attributes(quantity: '3'.to_i )
    end
  end
end
