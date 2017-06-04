require 'csv'
require_relative 'invoice'
require_relative 'csv_opener'
require_relative 'sales_items'

class InvoiceRepository

  include SalesItems

  attr_reader :invoices, :collection

  def initialize(csv_file, sales_engine)
    @sales_engine = sales_engine
    @collection = []
    populate_invoices_repo(csv_file, "invoice")
  end

  def populate_invoices_repo(csv_file, type)
    @collection = CSVOpener.new(csv_file, self, type)
    @collection = @collection.holder
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def find_all_by_customer_id(customer_id)
    return_value = @collection.select do |invoice|
      invoice.customer_id == customer_id
    end
    return_value
  end

  def find_all_by_status(status)
    return_value = @collection.select do |invoice|
      invoice.status == status
    end
    return_value
  end

  def merchant(merchant_id)
    @sales_engine.merchant(merchant_id)
  end

end
