require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sales_engine'

class SalesEngineTest < Minitest::Test

  def test_it_exists
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    items = se.items
    merchants = se.merchants
    assert_instance_of ItemRepository, items
    assert_instance_of MerchantRepository, merchants
  end

  def test_items_can_searched_via_find_by_id
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    items = se.items
    assert_instance_of Item, items.find_by_id(263395237)
  end

  def test_items_can_searched_via_find_by_name
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    items = se.items
    assert_instance_of Item, items.find_by_name("510+ RealPush Icon Set")
  end

  def test_items_can_searched_via_find_all_by_price
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    items = se.items
    assert_equal 7, items.find_all_by_price(400.00).length
  end

  def test_items_can_searched_via_find_by_merchant_id
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    items = se.items
    assert_equal 1, items.find_all_by_merchant_id(12334141).length
  end

  def test_it_returns_empty_array_with_invalid_merchant_id
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    items = se.items
    assert_equal items.find_all_by_merchant_id("kwjalkdwja"), []
  end

  def test_merchant_customers_puts_array_of_all_customers
    skip
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    merchant = se.merchants.find_by_id(12335938)
    result = merchant.customers

    assert_instance_of Array, result
    assert_equal 1, result[0]
  end

  def test_invoice_dot_items_puts_array_of_all_items
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    invoice = se.invoices.find_by_id(20)
    result = invoice.items
    assert_equal 5, result.length
    assert_instance_of Item, result[0]
  end

  def test_invoices_dot_transactions_puts_array_of_transactions
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    invoice = se.invoices.find_by_id(20)
    result = invoice.transactions
    assert_instance_of Array, result
    assert_equal 3, result.length
    assert_instance_of Transaction, result[0]
  end

  def test_invoices_can_find_customer
    se = SalesEngine.from_csv({
      :items => "./data/items.csv",
      :merchants => "./data/merchants.csv",
      :invoices => "./data/invoices.csv",
      :invoice_items => "./data/invoice_items.csv",
      :transactions => "./data/transactions.csv",
      :customers => "./data/customers.csv"
      })
    invoice = se.invoices.find_by_id(20)
    result = invoice.customer
    assert_instance_of Customer, result
    assert_equal "Sylvester", result.first_name
  end
end
