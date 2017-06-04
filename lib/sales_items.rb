module SalesItems

  def all
    @collection
  end

  def find_by_id(id)
    return_value = @collection.select do |thing|
      thing.id.to_i == id
    end
    return_value.first
  end

  def find_by_name(name)
    return_value = @collection.select do |thing|
      thing.name == name.downcase || thing.name == name || thing.name.downcase == name
    end
    return_value.first
  end

  def find_all_by_name(snippet)
    @collection.select do |thing|
      thing.name.include?(snippet) || thing.name.downcase.include?(snippet)
    end
  end

  def find_all_by_merchant_id(merchant_id)
    @collection.select do |thing|
      thing.merchant_id.to_i == merchant_id
    end
  end

  def find_all_by_invoice_id(invoice_id)
    @collection.select do |thing|
      thing.invoice_id.to_i == invoice_id
    end
  end

end
