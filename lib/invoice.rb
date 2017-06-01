class Invoice

  attr_reader :id

  def initialize(item_hash)
    @id = item_hash[:id].to_i
  end

end
