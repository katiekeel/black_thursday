class Invoice

  def initialize(item_hash)
    @id = item_hash[:id].to_i
  end

end
