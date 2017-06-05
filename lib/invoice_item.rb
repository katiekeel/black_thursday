class InvoiceItem

  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at

  def initialize(invoice_item_hash, invoice_item_repo)
    @invoice_item_repo = invoice_item_repo
    @id = invoice_item_hash[:id].to_i
    @item_id = invoice_item_hash[:item_id].to_i
    @invoice_id = invoice_item_hash[:invoice_id].to_i
    @quantity = invoice_item_hash[:quantity].to_i
    @unit_price = BigDecimal.new(item_hash[:unit_price]) / 100  unless invoice_item_hash[:unit_price] == nil
    @created_at = invoice_item_hash[:created_at]
    @updated_at = invoice_item_hash[:updated_at]
  end

  def unit_price_to_dollars
    price = @unit_price.to_f 
    price.round(2)
  end

  def create_unit_price(price)
    price = to_big_decimal(price)
    price = unit_price_to_dollars(price)
  end

  def to_big_decimal(price)
    price = BigDecimal.new(price, price.length)
  end

  def unit_price_to_dollars(price)
    price = price / 100
  end

end
