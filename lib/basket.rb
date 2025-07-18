class Basket
  def initialize(catalogue, delivery_rule, offer)
    @catalogue = catalogue
    @delivery_rule = delivery_rule
    @offer = offer
    @items = []
  end

  def add(product_code)
    raise "Invalid product code" unless @catalogue.product_codes.include?(product_code)
    @items << product_code
  end

  def total
    discount = @offer.apply(@items)
    
    subtotal = calculate_subtotal - discount

    delivery_cost = @delivery_rule.cost_for(subtotal)
    (subtotal + delivery_cost).round(2)
  end

  private

  def calculate_subtotal
    @items.sum { |code| @catalogue.price_for(code) }.round(2)
  end
end