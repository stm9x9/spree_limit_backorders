module SpreeLimitBackorders::Extensions::Models::Quantifier
  def backorderable_units
    stock_items.select(&:backorderable?)
  end

  def unlimited_backorders?
    backorderable_units.any? {|unit| unit.max_backorders == 0 }
  end

  def backorderable?(required=1)
    unlimited_backorders? || (total_on_hand + quantity_remaining_for_backorder) >= required
  end

  def quantity_available_for_backorder
    backorderable_units.sum(&:max_backorders)
  end

  def quantity_used_for_backorder
    backorderable_units.sum do |unit|
      unit.backordered_inventory_units.size
    end
  end

  def quantity_remaining_for_backorder
    quantity_available_for_backorder - quantity_used_for_backorder
  end

  def can_supply?(required)
    total_on_hand >= required || backorderable?(required)
  end
end
