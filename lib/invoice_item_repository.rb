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
    ir = InvoiceItemRepository.new(@file, sales_engine)
  end

  def populate_invoice_items_repo(file, type)
    @collection = CSVOpener.new(@file, self, type)
    @collection = @collection.holder
  end

  def find_all_by_item_id(item_id)
    return_matches = @collection.select do |invoice_item|
      invoice_item.item_id == item_id
    end
    return_matches
  end


end
