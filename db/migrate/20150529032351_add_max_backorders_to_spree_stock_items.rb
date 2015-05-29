class AddMaxBackordersToSpreeStockItems < ActiveRecord::Migration
  def change
    add_column :spree_stock_items, :max_backorders, :integer, default: 0
  end
end
