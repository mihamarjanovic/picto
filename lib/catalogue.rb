class Catalogue
  def initialize
    @products = {
      'R01' => 32.95,
      'G01' => 24.95,
      'B01' => 7.95
    }
  end

  def price_for(code)
    @products[code] || raise("Unknown product code: #{code}")
  end

  def product_codes
    @products.keys
  end
end