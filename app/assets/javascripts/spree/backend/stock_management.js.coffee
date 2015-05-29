jQuery ->
  $('.toggle_stock_item_backorderable').on 'submit', ->
    $.ajax
      type: @method
      url: @action
      data: $(@).serialize()
    false

  $('.toggle_stock_item_backorderable a.save-link').on 'click', ->
    $(this).closest('form').submit()

    false
