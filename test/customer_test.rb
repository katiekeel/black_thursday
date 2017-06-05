require './test/test_helper'
require './lib/customer'

class CustomerTest < Minitest::Test

  def test_customer_exists
    customer = Customer.new({:id => 1}, customer_repo = nil)
    assert_instance_of Customer, customer
  end

  def test_customer_has_id
    customer = Customer.new({:id => 1}, customer_repo = nil)
    assert_equal customer.id, 1
  end

  def test_customer_id_is_integer
    customer = Customer.new({:id => 1}, customer_repo = nil)
    assert_instance_of Integer, customer.id
  end

  def test_customer_has_first_name
    customer = Customer.new({:first_name => "Katie"}, customer_repo = nil)
    assert_equal customer.first_name, "Katie"
  end

  def test_customer_first_name_is_string
    customer = Customer.new({:first_name => "Katie"}, customer_repo = nil)
    assert_instance_of String, customer.first_name
  end

  def test_customer_has_last_name
    customer = Customer.new({:last_name => "Shermer"}, customer_repo = nil)
    assert_equal customer.last_name, "Shermer"
  end

  def test_customer_last_name_is_string
    customer = Customer.new({:last_name => "Shermer"}, customer_repo = nil)
    assert_instance_of String, customer.last_name
  end

  def test_customer_has_create_date
    customer = Customer.new({:created_at => 1}, customer_repo = nil)
    assert_equal customer.created_at, 1
  end

  def test_customer_create_date_is_time
    customer = Customer.new({:created_at => Time.now}, customer_repo = nil)
    assert_instance_of Time, customer.created_at
  end

  def test_customer_has_update_date
    customer = Customer.new({:updated_at => 1}, customer_repo = nil)
    assert_equal customer.updated_at, 1
  end

  def test_customer_update_date_is_time
    customer = Customer.new({:updated_at => Time.now}, customer_repo = nil)
    assert_instance_of Time, customer.updated_at
  end

end
