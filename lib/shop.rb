require 'pry'
require_relative 'products/skus'

class Shop
  include Products::Skus
  def initialize
    @total = 0
    @counters = {
      'A' => 0,
      'B' => 0
    }
  end

  def checkout(basket)
    total_reset
    return -1 unless basket.is_a? String
    sort_basket(basket)
    @total
  end

  private

  def sort_basket(basket)
    basket.split('').each do |product|
      return @total = -1 unless SKUS.include?(product)
      calculate_price(product)
    end
    calculate_discount
  end

  def calculate_price(product)
    SKUS.each do |sku, value|
      @total += value[:amount] if product == sku
    end
    product_counter(product)
  end

  def counter_reset
    @counters.each do |counter|
      counter[1] = 0
    end
  end

  def calculate_discount
    @counters.each do |sku|
      @total -=
        @counters[sku[0]]/SKUS[sku[0]][:deal_amount] * SKUS[sku[0]][:discount]
    end
    counter_reset
  end

  def product_counter(product)
    @counters.each do |sku|
      if sku[0] == product
        @counters[product] += 1
      end
    end
  end

  def total_reset
    @total = 0
  end
end
