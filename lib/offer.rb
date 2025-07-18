class Offer
  def initialize(catalogue)
    @catalogue = catalogue
  end

  def apply(items)
    red_widget_count = items.count('R01')
    return 0.0 unless red_widget_count >= 2

    full_price = @catalogue.price_for('R01')
    half_price = full_price / 2.0

    (red_widget_count / 2) * half_price
  end
end