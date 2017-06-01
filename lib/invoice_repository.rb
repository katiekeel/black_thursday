require 'csv'
require './lib/invoice'

class InvoiceRepository

  def initialize(csv_file)
    @invoices = []
    populate_invoices_repo(csv_file)
  end

  def populate_invoices_repo(csv_file)
    invoices_list = CSV.open csv_file, headers: true, header_converters: :symbol
    invoices_list.each do |row|
      invoice = Invoice.new(row)
      @invoices << invoice
    end
    invoices_list.close
  end

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

end
