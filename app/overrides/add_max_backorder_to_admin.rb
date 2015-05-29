Deface::Override.new virtual_path: "spree/admin/products/stock",
                     name: "limit_backorders_admin_stock_form",
                     replace_contents: "td.stock_location_info td:nth(3)",
                     partial: "spree/admin/products/max_backorders_field"
