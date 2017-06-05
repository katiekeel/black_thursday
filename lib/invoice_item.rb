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
    @unit_price = BigDecimal.new(item_hash[:unit_price]) / 100 unless item_hash[:unit_price] == nil
    @updated_at = invoice_item_hash[:updated_at]
  end

  def unit_price_to_dollars
    @unit_price.to_f
  end

end
