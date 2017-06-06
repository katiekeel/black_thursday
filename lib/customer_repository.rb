require_relative 'customer'
require_relative 'csv_opener'
require_relative 'sales_items'

class CustomerRepository

  include SalesItems

  attr_reader :collection, :file

  def initialize(sales_engine)
    @file = file
    @sales_engine = sales_engine
    @collection = []
  end

  def from_csv(file)
    @file = file
    populate_customers_repo(@file, "customer")
  end

  def populate_customers_repo(file, type)
    @collection = CSVOpener.new(@file, self, type)
    @collection = @collection.holder
  end
<<<<<<< HEAD
  # 
  # def inspect
  #   "#<#{self.class} #{@collection.size} rows>"
  # end
=======

  def inspect
    "#<#{self.class} #{@collection.size} rows>"
  end
>>>>>>> iteration_4

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

end
