require 'rspec'
require_relative '../lib/product'
require_relative '../lib/disc'

describe 'Disc initialize' do
  let (:file_path) { File.dirname(__FILE__) + '/fixtures/1.txt'}
  let (:disc) {Disc.from_file(file_path) }

    it "checks disc init attributes" do
      expect(disc).to have_attributes(
        title: 'Painkiller',
        author: 'Judas Priest',
        genre: 'Heavy Metal',
        year: '1990'.to_i,
        price: '990'.to_i,
        quantity: '3'.to_i
        )
    end
end
