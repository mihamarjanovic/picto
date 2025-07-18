class DeliveryRule
  def initialize
    @rules = [
      { threshold: 90.00, cost: 0.00 },
      { threshold: 50.00, cost: 2.95 },
      { threshold: 0.00,  cost: 4.95 }
    ]
  end

  def cost_for(subtotal)
    @rules.find { |rule| subtotal >= rule[:threshold] }[:cost]
  end
end