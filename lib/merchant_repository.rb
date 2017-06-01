require 'csv'
require_relative 'merchant'

class MerchantRepository
  attr_reader :merchants, :sales_engine

  def initialize(csv_file, sales_engine)
    @sales_engine = sales_engine
    @merchants = []
    populate_merchant_repo(csv_file)
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def populate_merchant_repo(csv_file)
    merchant_list = CSV.open csv_file, headers: true, header_converters: :symbol
    merchant_list.each do |row|
      individual = Merchant.new({:id => row[:id], :name => row[:name]}, self)
      @merchants << individual
    end
    merchant_list.close
  end

  def merchants_container(individual = nil)
    merchants_container = []
    merchants_container << individual
    merchants_container
  end

  def all
    @merchants
  end

  def find_by_name(name)
    return_value = @merchants.select do |merchant|
      merchant.name == name.downcase
    end
    return return_value.first if return_value.empty? == false
    return nil if return_value.empty?
  end

  def find_by_id(id)
    return_value = @merchants.select do |merchant|
      merchant.id == id.to_i
    end
    return return_value.first if return_value.empty? == false
    return nil if return_value.empty?
  end

  def find_all_by_name(snippet)
    return_matches = @merchants.select do |merchant|
      merchant.name.include?(snippet.downcase)
    end
    return_matches
  end

  def merchant_repo_items(merchant_id)
    @sales_engine.sales_engine_items(merchant_id)
  end

  def merchant(item_id)
    find_by_id(item_id)
  end

  def merchant_repo_invoices(merchant_id)
    @sales_engine.sales_engine_invoices(merchant_id)
  end

end
