require 'pry'

class Shop
  def initialize
    @total = 0
    @counters = {
      'A' => 0,
      'B' => 0
    }

  end

  SKUS = {
    'A' => {:amount => 50, deal_amount: 3, discount: 20},
    'B' => {:amount => 30, deal_amount: 2, discount: 15},
    'C' => {:amount => 20},
    'D' => {:amount => 15}
  }

  def checkout(basket)
    total_reset

    return -1 unless basket.is_a? String
    basket.split('').each do |product|
      return -1 unless SKUS.include?(product)
      calculate_price(product)
      product_counter(product)
    end
    calculate_discount
    counter_reset
    @total
  end

  private

  def calculate_price(product)
    SKUS.each do |sku, value|
      @total += value[:amount] if product == sku
    end
  end

  def counter_reset
    @counters.each do |counter|
      counter[1] = 0
    end
  end

  def calculate_discount
    @total -= (@counters['A']/SKUS['A'][:deal_amount] * SKUS['A'][:discount])
    @total -= (@counters['B']/SKUS['B'][:deal_amount] * SKUS['B'][:discount])
  end

  def product_counter(product)
    @counters.each do |p, c|
      if p == product
        @counters[product] += 1
      end
    end
  end

  def total_reset
    @total = 0
  end
end
