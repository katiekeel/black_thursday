require 'csv'
require_relative 'merchant'
require_relative 'csv_opener'
require_relative 'sales_items'

class MerchantRepository

  include SalesItems

  attr_reader :collection, :sales_engine

  def initialize(csv_file, sales_engine)
    @sales_engine = sales_engine
    @collection = []
    populate_merchant_repo(csv_file, "merchant")
  end

  # def inspect
  #   "#<#{self.class} #{@merchants.size} rows>"
  # end

  def populate_merchant_repo(csv_file, type)
    @collection = CSVOpener.new(csv_file, self, type)
    @collection = @collection.holder
  end

  def merchant_repo_items(merchant_id)
    @sales_engine.sales_engine_items(merchant_id)
  end

  def merchant(merchant_id)
    find_by_id(merchant_id)
  end

  def merchant_repo_invoices(merchant_id)
    @sales_engine.sales_engine_invoices(merchant_id)
  end

  def merchant_repo_customers(merchant_id)
    @sales_engine.sales_engine_customers(merchant_id)
  end

  def find_all_by_merchant_id(merchant_id_array)
    @collection.select do |merchant|
      merchant_id_array.include?(merchant.id)
    end
  end
end
