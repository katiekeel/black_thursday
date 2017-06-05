require './test/test_helper'
require './lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test

  def test_customer_repository_exists
    cr = CustomerRepository.new(sales_engine = nil)
    cr.from_csv("./data/customers.csv")
    assert_instance_of CustomerRepository, cr
  end

  def test_customer_repository_can_be_populated
    cr = CustomerRepository.new(sales_engine = nil)
    cr.from_csv("./data/customers.csv")
    assert_equal cr.collection.count, 1000
  end

  def test_customer_repository_all
    cr = CustomerRepository.new(sales_engine = nil)
    cr.from_csv("./data/customers.csv")
    customer_repo = cr.all
    assert_equal customer_repo.count, 1000
  end

  def test_customer_repository_find_by_id
    cr = CustomerRepository.new(sales_engine = nil)
    cr.from_csv("./data/customers.csv")
    customer = cr.find_by_id(1)
    assert_equal customer.id, 1
  end

  def test_customer_repository_find_by_id_with_nil
    cr = CustomerRepository.new(sales_engine = nil)
    cr.from_csv("./data/customers.csv")
    customer = cr.find_by_id(213912739872183)
    assert_nil customer
  end

  def test_customer_repository_find_all_by_first_name
    cr = CustomerRepository.new(sales_engine = nil)
    cr.from_csv("./data/customers.csv")
    customers = cr.find_all_by_first_name("Bill")
    assert_equal customers.count, 2
  end

  def test_customer_repository_find_all_by_first_name_empty
    cr = CustomerRepository.new(sales_engine = nil)
    cr.from_csv("./data/customers.csv")
    customers = cr.find_all_by_first_name("askudhuiwhaduhwdkaj")
    assert_empty customers
  end

  def test_customer_repository_find_all_by_last_name
    cr = CustomerRepository.new(sales_engine = nil)
    cr.from_csv("./data/customers.csv")
    customers = cr.find_all_by_last_name("Smith")
    assert_equal customers.count, 3
  end

  def test_customer_repository_find_all_by_last_name_empty
    cr = CustomerRepository.new(sales_engine = nil)
    cr.from_csv("./data/customers.csv")
    customers = cr.find_all_by_last_name("ajfnlakdlkasdlksadaja")
    assert_empty customers
  end

end
