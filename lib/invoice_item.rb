class InvoiceItem

  def initialize(invoice_item_hash, invoice_item_repo)
    @invoice_item_hash = invoice_item_hash
    @invoice_item_repo = invoice_item_repo
  end

end


# id - returns the integer id
# item_id - returns the item id
# invoice_id - returns the invoice id
# quantity - returns the quantity
# unit_price - returns the unit_price
# created_at - returns a Time instance for the date the invoice item was first created
# updated_at - returns a Time instance for the date the invoice item was last modified
