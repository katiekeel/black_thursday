class Merchant

  attr_reader :id, :name, :merchant_repo

  def initialize(id_name_hash, merchant_repo)
    @merchant_repo = merchant_repo
    @id = id_name_hash[:id].to_i
    @name = id_name_hash[:name]
  end

  def items
    @merchant_repo.merchant_repo_items(@id)
    # require 'pry' ; binding.pry
  end

  def invoices
    @merchant_repo.merchant_repo_invoices(@id)
  end

  def customers
    @merchant_repo.merchant_repo_customers(@id)
  end

end
