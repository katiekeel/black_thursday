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
    @unit_price = invoice_item_hash[:unit_price].to_i
    @created_at = invoice_item_hash[:created_at]
    @updated_at = invoice_item_hash[:updated_at]
  end

end


# id - returns the integer id
# item_id - returns the item id
# invoice_id - returns the invoice id
# quantity - returns the quantity
# unit_price - returns the unit_price
# created_at - returns a Time instance for the date the invoice item was first created
# updated_at - returns a Time instance for the date the invoice item was last modified
