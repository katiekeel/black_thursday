require_relative 'transaction'
require_relative 'sales_items'
require_relative 'csv_opener'

class TransactionRepository

  include SalesItems

  attr_reader :collection, :file

  def initialize(sales_engine)
    @file = file
    @sales_engine = sales_engine
    @collection = []
  end

  def from_csv(file)
    @file = file
    populate_transactions_repo(@file, "transaction")
  end

  def inspect
    "#<#{self.class} #{@collection.size} rows>"
  end

  def populate_transactions_repo(file, type)
    @collection = CSVOpener.new(@file, self, type)
    @collection = @collection.holder
  end

  def find_all_by_credit_card_number(cc_number)
    @collection.select do |transaction|
      transaction.credit_card_number == cc_number
    end
  end

  def find_all_by_result(result)
    @collection.select do |transaction|
      transaction.result == result
    end
  end

  def find_all_by_invoice_id(invoice_id)
    @collection.select do |transaction|
      transaction.invoice_id == invoice_id
    end
  end

  def invoice(invoice_id)
    @sales_engine.find_invoice_by_transaction_invoice_id(invoice_id)
  end

  def is_paid_in_full?(invoice_id)
    all_by_invoice_id = find_all_by_invoice_id(invoice_id)
    results = all_by_invoice_id.map do |transaction|
      transaction.result
    end
    return false if results.include?("failed") #|| all_by_invoice_id.empty?
    return true if results.include?("failed") == false
  end

  def is_pending?(invoice_id)
    all_by_invoice_id = find_all_by_invoice_id(invoice_id)
    results = all_by_invoice_id.map do |transaction|
      transaction.result
    end
    return false if results.include?("success")
    return true if results.all?{|result| result == "failed"} || all_by_invoice_id.empty?
  end
end
