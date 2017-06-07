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
    "#<#{self.class} #{@collection.size} rows>"
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

  def items(id)
    @sales_engine.find_invoice_items_by_invoice_id(id)
  end

  def transactions(invoice_id)
    @sales_engine.find_transactions_by_invoice_id(invoice_id)
  end

  def customer(customer_id)
    @sales_engine.customer(customer_id)
  end

  def merchant(merchant_id)
    @sales_engine.find_merchant_by_invoice_id(merchant_id)
  end

  def find_invoice_items(invoice_id)
    @sales_engine.invoice_items.find_all_by_invoice_id(invoice_id)
  end

  def find_all_items_by_invoice_id(invoice_id)
    @sales_engine.find_all_items_by_invoice_id(invoice_id)
  end

  def total(id)
    @sales_engine.total(id)
  end

  def is_paid_in_full?(invoice_id)
    @sales_engine.is_paid_in_full?(invoice_id)
  end

  def invoices_shipped_by_date(date)
    invoice_ids = []
    @collection.select do |invoice|
      invoice_date = Date.parse(invoice.created_at.to_s)
      if invoice_date <= date && invoice.status == "shipped"
        invoice_ids << invoice.id
      end
    end
    invoice_ids
  end
end
