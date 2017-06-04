require_relative 'customer'
require_relative 'csv_opener'
require_relative 'sales_items'

class CustomerRepository

  include SalesItems

  attr_reader :collection

  def initialize(file, sales_engine)
    @file = file
    @sales_engine = sales_engine
    @collection = []
    populate_customers_repo(@file, "customer")
  end

  def self.from_csv(file)
    CustomerRepository.new(file, self, type)
  end

  def populate_customers_repo(file, type)
    @collection = CSVOpener.new(@file, self, type)
    @collection = @collection.holder
  end

  def find_all_by_first_name(first_name)
    @collection.select do |customer|
      customer.first_name == first_name
    end
  end

  def find_all_by_last_name(last_name)
    @collection.select do |customer|
      customer.last_name == last_name
    end
  end

  def find_merchant_ids_by_id(customer_id)
    @sales_engine.invoices.find_all_merchant_ids_by_customer_id(customer_id)
  end

  def find_all_merchants_by_ids(merchant_array)
    merchant_array.map {|merchant_id| @sales_engine.merchants.find_by_id(merchant_id)}
  end
end
