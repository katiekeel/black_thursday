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

end

# id - returns the integer id
# first_name - returns the first name
# last_name - returns the last name
# created_at - returns a Time instance for the date the customer was first created
# updated_at - returns a Time instance for the date the customer was last modified
