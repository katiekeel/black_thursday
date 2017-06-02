require_relative 'transaction'
require_relative 'sales_engine'
require_relative 'sales_items'
require_relative 'csv_opener'

class TransactionRepository

  include SalesItems

  attr_reader :collection

  def initialize(file, sales_engine)
    @file = file
    @collection = []
    @sales_engine = sales_engine
    populate_transactions_repo(@file, "transaction")
  end

  def self.from_csv(file)
    tr = TransactionRepository.new(file)
  end

  def populate_transactions_repo(file, type)
    @collection = CSVOpener.new(@file, self, type)
    @collection = @collection.holder
  end

  def find_all_by_credit_card_number(cc_number)
    return_matches = @collection.select do |transaction|
      transaction.credit_card_number == cc_number
    end
    return_matches
  end

  def find_all_by_result(result)
    return_matches = @collection.select do |transaction|
      transaction.result == result
    end
    return_matches
  end
end
