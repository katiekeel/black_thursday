module SalesItems

  def all
    @collection
  end

  def find_by_id(id, collection = @collection)
    return_value = collection.select do |thing|
      thing.id == id
    end
    return_value.first
  end

  def find_by_name(name, collection = @collection)
    return_value = collection.select do |thing|
      thing.name == name.downcase || thing.name == name || thing.name.downcase == name
    end
    return_value.first
  end

  def find_all_by_name(snippet, collection = @collection)
    return_matches = collection.select do |thing|
      thing.name.include?(snippet) || thing.name.downcase.include?(snippet)
    end
    return_matches
  end

  def find_all_by_merchant_id(merchant_id, collection = @collection)
    return_matches = collection.select do |thing|
      thing.merchant_id == merchant_id
    end
    return_matches
  end

end
