require 'csv'
require './lib/merchant'


class MerchantRepository
  attr_reader :merchants

  def initialize
    @merchants = {}
  end

  def populate_merchant_repo
    merchant_list = CSV.open "./data/merchants.csv", headers: true, header_converters: :symbol
    merchant_list.each { |row|
      individual = Merchant.new({:id => row[:id], :name => row[:name]})
        @merchants[individual.id] = individual
      }
  end

  def find_by_name(name)
    name = name.downcase
    @merchants.each_value {|value|
      if value.name == name
        return value
      else
        return nil
      end
    }
  end

  def find_by_id(id)
    id = id.to_i
    @merchants.each_key { |key|
      if key == id
        return key
      else
        return nil
      end
    }
  end

  def find_all_by_name(snippet)
    return_matches = []
    snippet = snippet.downcase
    require 'pry' ; binding.pry
    @merchants.each_value {|value|
      if value.name.include?(snippet)   
        return_matches << value.name
      end
      }
    return_matches
  end

end
#
# merchant = MerchantRepository.new
# merchant.populate_merchant_repo
# merchant.find_by_name("Shopin1901")
# puts merchant.merchants
