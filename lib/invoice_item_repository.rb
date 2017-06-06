require_relative 'sales_items'
require_relative 'invoice_item'
require_relative 'csv_opener'

class InvoiceItemRepository

  include SalesItems

  attr_reader :collection, :file

  def initialize(sales_engine)
    @file = file
    @sales_engine = sales_engine
    @collection = []
  end

  def from_csv(file, sales_engine = nil)
    @file = file
    populate_invoice_items_repo(@file, "invoice_item")
  end

  def populate_invoice_items_repo(file, type)
    @collection = CSVOpener.new(@file, self, type)
    @collection = @collection.holder
  end
  # 
  # def inspect
  #   "#<#{self.class} #{@collection.size} rows>"
  # end

  def find_all_by_item_id(item_id)
    @collection.select do |invoice_item|
      invoice_item.item_id == item_id
    end
  end

  def total(invoice_id)
    invoice_items = @collection.select do |invoice_item|
        invoice_item.invoice_id == invoice_id
    end
    total = invoice_items.map do |invoice_item|
      invoice_item.unit_price_to_dollars * invoice_item.quantity
    end
    total.reduce(:+)
  end

  def find_all_items_by_invoices(invoice_ids)
    item_hash = {}
    item_ids = @collection.each do |invoice_item|
      if invoice_ids.include?(invoice_item.invoice_id) == true
        item_hash[invoice_item.unit_price] = invoice_item.quantity
      end
    end
    item_hash
  end
end
