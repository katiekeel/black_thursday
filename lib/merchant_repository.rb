require 'csv'
require './lib/merchant'

class MerchantRepository
  attr_reader :merchants, :sales_engine

  def initialize(csv_file, sales_engine)
    @sales_engine = sales_engine
    @merchants = {}
    populate_merchant_repo(csv_file)
  end

  def populate_merchant_repo(csv_file)
    merchant_list = CSV.open csv_file, headers: true, header_converters: :symbol
    merchant_list.each do |row|
      individual = Merchant.new({:id => row[:id], :name => row[:name]}, self)
      @merchants[individual.id] = individual
    end
    merchant_list.close
  end

  def all
    @merchants.each {|key, value| puts value}
  end

  def find_by_name(name)
    name = name.downcase
    @merchants.each_value do |value|
      if value.name == name
        return value
      else
        next
      end
    end
    nil
  end

  def find_by_id(id)
    id = id.to_i
    @merchants.each_value do |key, value|
      if key == id
        return value
      else
        next
      end
    end
    nil
  end

  def find_all_by_name(snippet)
    return_matches = []
    snippet = snippet.downcase
    @merchants.each_value do |value|
      if value.name.include?(snippet)
        return_matches << value.name
      end
    end
    return_matches
  end

  def merchant_repo_items(merchant_id)
    @sales_engine.sales_engine_items(merchant_id)
  end

  def merchant(item_id)
    find_by_id(item_id)
  end

end
