require 'shop'

RSpec.describe Shop do

  subject(:shop) { Shop.new }

  it 'responds to checkout' do
    expect(shop).to respond_to(:checkout)
  end

  describe '#checkout' do
    it 'takes an argument and returns an integer' do
      expect(shop.checkout('arg')).to be_an(Integer)
    end

    it 'returns -1 if argument is not a string' do
      expect(shop.checkout(18)).to eq(-1)
    end

    it 'returns 50 for A' do
      expect(shop.checkout('A')).to eq(50)
    end

    it 'returns 100 for AA' do
      expect(shop.checkout('AA')).to eq(100)
    end

    it 'returns -1 for a' do
      expect(shop.checkout('a')).to eq(-1)
    end

    it 'returns -1 for Aa' do
      expect(shop.checkout('Aa')).to eq(-1)
    end

    it 'returns 30 for B' do
      expect(shop.checkout('B')).to eq(30)
    end

    it 'returns 20 for C' do
      expect(shop.checkout('C')).to eq(20)
    end

    it 'returns 15 for D' do
      expect(shop.checkout('D')).to eq(15)
    end

    it 'returns 115 for ABCD' do
      expect(shop.checkout('ABCD')).to eq(115)
    end

    it 'returns 130 for AAA' do
      expect(shop.checkout('AAA')).to eq(130)
    end

    it 'returns 260 for AAAAAA' do
      expect(shop.checkout('AAAAAA')).to eq(260)
    end
    
    it 'returns 45 for BB' do
      expect(shop.checkout('BB')).to eq(45)
    end
  end
end
