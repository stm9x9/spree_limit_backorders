module SpreeLimitBackorders::Extensions::Controllers::Admin::StockItemsController
  def self.prepended(klass)
    klass.before_filter :set_max_backorders, only: :update
  end

private

  def set_max_backorders
    max_backorders = params[:stock_item] && params[:stock_item][:max_backorders]
    @stock_item.max_backorders = max_backorders if @stock_item && max_backorders
  end
end
