module SalesItems

  def module_find_by_id(collection, id)
    return_value = collection.select do |thing|
      thing.id == id.to_i
    end
    return_value.first
  end

end
