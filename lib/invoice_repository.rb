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

  def invoice_repo_merchant(merchant_id)
    @sales_engine.sales_engine_merchant(merchant_id)
  end

  def find_invoice_items(invoice_id)
    @sales_engine.invoice_items.find_all_by_invoice_id(invoice_id)
  end

  def find_all_items_by_invoice_id(invoice_id)
    @sales_engine.invoice_items.find_all_items_by_invoice_id(invoice_id)
  end

  def find_transaction_with_id(invoice_id)
    @sales_engine.transactions.find_all_by_invoice_id(invoice_id)
  end

  def find_customer(customer_id)
    @sales_engine.customers.find_by_id(customer_id)
  end

  def find_all_merchant_ids_by_customer_id(customer_id)
    invoice_ids = []
    @collection.each do |invoice|
      if invoice.customer_id == customer_id
        invoice_ids << invoice.merchant_id
      end
    end
    invoice_ids
  end

  def invoice_repo_paid_in_full?(id)
    @sales_engine.invoice_paid_in_full?(id)
  end

  def total(id)
    @sales_engine.total(id)
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
