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

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def find_all_by_first_name(first_name)
    @collection.select do |customer|
      customer.first_name.downcase.include?(first_name.downcase)
    end
  end

  def find_all_by_last_name(last_name)
    @collection.select do |customer|
      customer.last_name.downcase.include?(last_name.downcase)
    end
  end

  def find_multiple_customers_by_id(customer_ids)
    results = customer_ids.map do |customer_id|
      find_by_id(customer_id)
    end
    results.uniq
  end

  def merchants(customer_id)
    @sales_engine.find_merchants_by_customer_id(customer_id)
  end

  def find_merchant_ids_by_id(customer_id)
    @sales_engine.invoices.find_all_merchant_ids_by_id(customer_id)
  end

  def find_my_merchants(merchant_id_array)
    @sales_engine.merchants.find_all_by_merchant_ids(merchant_id_array)
  end

end
