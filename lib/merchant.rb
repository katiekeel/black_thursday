class Merchant

  attr_reader :id,
              :name,
              :created_at
              :merchant_repo

  def initialize(id_name_hash, merchant_repo)
    @merchant_repo = merchant_repo
    @id = id_name_hash[:id].to_i
    @name = id_name_hash[:name]
    @created_at = id_name_hash[:created_at]
  end

  def items
    @merchant_repo.items(@id)
  end

  def invoices
    @merchant_repo.invoices(@id)
  end

  def customers
    @merchant_repo.customers(id)
  end

  def total_revenue
    @merchant_repo.total_revenue(@id)
  end
end
