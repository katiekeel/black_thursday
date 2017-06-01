require './lib/merchant_repository'

class Merchant

  attr_reader :id, :name, :merchant_repo

  def initialize(id_name_hash, merchant_repo)
    @merchant_repo = merchant_repo
    @id = id_name_hash[:id].to_i
    @name = id_name_hash[:name].downcase
  end

  def items
    @merchant_repo.merchant_repo_items(@id)
  end

end

#
# merchant = Merchant.new({:id => 12344512, :name => "Daniel"}, {:merchant_repo => "a long list of things"})
# require 'pry' ; binding.pry
