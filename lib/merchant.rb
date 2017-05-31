class Merchant

  attr_reader :id, :name

  def initialize(id_name_hash, merchant_repo)
    @merchant_repo = merchant_repo
    @id = id_name_hash[:id].to_i
    @name = id_name_hash[:name].downcase
  end

  def items
    @merchant_repo.items(id)
  end

end
