require_relative 'sales_items'

class InvoiceItemRepository

  include SalesItems

  attr_reader :collection

  def initialize(file, sales_engine)
    @sales_engine = sales_engine
    @collection = []
    populate_invoice_items_repo
  end

  def self.from_csv(file)
    ir = InvoiceItemRepository.new(file, sales_engine)
  end

  def populate_invoice_items_repo
    @collection = CSVOpener.new(csv_file, self, type)
    @collection = @collection.holder
  end

end
