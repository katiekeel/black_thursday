require 'csv'
require_relative 'invoice'
require_relative 'csv_opener'

class InvoiceRepository

  attr_reader :invoices

  def initialize(csv_file, sales_engine)
    @sales_engine = sales_engine
    @invoices = []
    populate_invoices_repo(csv_file, "invoice")
  end

  def populate_invoices_repo(csv_file, type)
    @invoices = CSVOpener.new(csv_file, self, type)
    @invoices = @invoices.holder
    # invoices_list = CSV.open csv_file, headers: true, header_converters: :symbol
    # invoices_list.each do |row|
    #   invoice = Invoice.new({:id => row[:id], :customer_id => row[:customer_id], :merchant_id => row[:merchant_id], :status => row[:status], :created_at => row[:created_at], :updated_at => row[:updated_at]}, self)
    #   @invoices << invoice
    # end
    # invoices_list.close
  end
  #
  # def inspect
  #   "#<#{self.class} #{@merchants.size} rows>"
  # end

  def all
    @invoices
  end

  def find_by_id(id)
    return_value = @invoices.select do |invoice|
      invoice.id == id.to_i
    end
    return_value.first
  end

  def find_all_by_customer_id(customer_id)
    return_value = @invoices.select do |invoice|
      invoice.customer_id == customer_id
    end
    return_value
  end

  def find_all_by_merchant_id(merchant_id)
    return_value = @invoices.select do |invoice|
      invoice.merchant_id == merchant_id
    end
    return_value
  end


  def find_all_by_status(status)
    return_value = @invoices.select do |invoice|
      invoice.status == status
    end
    return_value
  end

  def merchant(merchant_id)
    @sales_engine.merchant(merchant_id)
  end

end
