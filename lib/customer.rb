class Customer

  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at

  def initialize(customer_hash, customer_repo)
    @customer_repo = customer_repo
    @id = customer_hash[:id].to_i
    @first_name = customer_hash[:first_name]
    @last_name = customer_hash[:last_name]
    @created_at = customer_hash[:created_at]
    @updated_at = customer_hash[:updated_at]
  end

  def merchant_ids
    @customer_repo.find_merchant_ids_by_id(@id)
  end

  def merchants
    merchant_id_array = merchant_ids
    @customer_repo.find_my_merchants(merchant_id_array)
  end

end
