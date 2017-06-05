require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer_repository.rb'
require 'pry'

class CustomerRepositoryTest < Minitest::Test

  def test_customer_repository_exists
    cr = CustomerRepository.new("./data/customers.csv", sales_engine = nil)
    assert_instance_of CustomerRepository, cr
  end

  def test_customer_repository_can_be_populated
    cr = CustomerRepository.new("./data/customers.csv", sales_engine = nil)
    assert_equal cr.collection.length, 1000
  end

  def test_customer_repository_all
    cr = CustomerRepository.new("./data/customers.csv", sales_engine = nil)
    customer_repo = cr.all
    assert_equal customer_repo.count, 1000
  end

  def test_customer_repository_find_by_id
    cr = CustomerRepository.new("./data/customers.csv", sales_engine = nil)
    customer = cr.find_by_id(1)
    assert_equal customer.id, 1
  end

  def test_customer_repository_find_all_by_first_name
    cr = CustomerRepository.new("./data/customers.csv", sales_engine = nil)
    customers = cr.find_all_by_first_name("Bill")
    assert_equal customers.count, 1
  end

  def test_customer_repository_find_all_by_last_name
    cr = CustomerRepository.new("./data/customers.csv", sales_engine = nil)
    customers = cr.find_all_by_last_name("Smith")
    assert_equal customers.count, 1
  end
end
