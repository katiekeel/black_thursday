require_relative 'sales_items'
require_relative 'invoice_item'
require_relative 'csv_opener'

class InvoiceItemRepository

  include SalesItems

  attr_reader :collection

  def initialize(file, sales_engine)
    @file = file
    @sales_engine = sales_engine
    @collection = []
    populate_invoice_items_repo(@file, "invoice_item")
  end

  def self.from_csv(file)
    InvoiceItemRepository.new(@file, sales_engine)
  end

  def populate_invoice_items_repo(file, type)
    @collection = CSVOpener.new(@file, self, type)
    @collection = @collection.holder
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def find_all_by_item_id(item_id)
    @collection.select do |invoice_item|
      invoice_item.item_id == item_id
    end
  end

  def find_all_items_by_invoice_id(invoice_id)
    item_ids = []
    @collection.each do |invoice_item|
      if invoice_item.invoice_id == invoice_id
        item_ids << invoice_item.item_id
      end
    end
    @sales_engine.items.find_items_by_item_ids(item_ids)
  end

  def total(invoice_id)
    invoice_items = @collection.select do |invoice_item|
        invoice_item.invoice_id == invoice_id
    end
    total = invoice_items.map do |invoice_item|
      invoice_item.unit_price * invoice_item.quantity
    end
    p total.sum
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
