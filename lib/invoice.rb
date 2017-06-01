class Invoice

  attr_reader :id, :customer_id

  def initialize(item_hash)
    @id = item_hash[:id].to_i
    @customer_id = item_hash[:customer_id].to_i
  end

end
