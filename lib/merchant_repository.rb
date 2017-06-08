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

  def inspect
    "#<#{self.class} #{@collection.size} rows>"
  end

  def populate_merchant_repo(csv_file, type)
    @collection = CSVOpener.new(csv_file, self, type)
    @collection = @collection.holder
  end

  def items(merchant_id)
    @sales_engine.find_items_by_merchant_id(merchant_id)
  end

  def invoices(merchant_id)
    @sales_engine.find_invoices_by_merchant_id(merchant_id)
  end

  def customers(merchant_id)
    @sales_engine.find_customers_by_merchant_id(merchant_id)
  end

  def total_revenue(merchant_id)
    @sales_engine.total_revenue_by_merchant_id(merchant_id)
  end

  def top_revenue_earners(x)
    @collection.sort_by{|merchant| total_revenue(merchant.id)}.reverse[0..x-1]
  end

  def find_multiple_merchants_by_id(merchant_ids)
    results = merchant_ids.map do |merchant_id|
      find_by_id(merchant_id)
    end
  end
end
