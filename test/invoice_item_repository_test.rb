require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item_repository.rb'
require 'pry'

class InvoiceItemRepositoryTest < Minitest::Test

  def test_invoice_item_repository_exists
    iir = InvoiceItemRepository.new("./data/invoice_items.csv", sales_engine = nil)
    assert_instance_of InvoiceItemRepository, iir
  end

  def test_populate_invoice_items_repo
    iir = InvoiceItemRepository.new("./data/invoice_items.csv", sales_engine = nil)
    assert_equal iir.collection.length, 21830
  end

  def test_invoice_item_all
    iir = InvoiceItemRepository.new("./data/invoice_items.csv", sales_engine = nil)
    assert_instance_of Array, iir.all
  end

  def test_invoice_item_find_by_id
    iir = InvoiceItemRepository.new("./data/invoice_items.csv", sales_engine = nil)
    invoice_item = iir.find_by_id(1)
    assert_equal invoice_item.id, 1
  end

  def test_invoice_item_find_all_by_item_id
    iir = InvoiceItemRepository.new("./data/invoice_items.csv", sales_engine = nil)
    invoice_items = iir.find_all_by_item_id(263519844)
    assert_equal invoice_items.length, 164
  end

  def test_invoice_item_find_all_by_invoice_id
    iir = InvoiceItemRepository.new("./data/invoice_items.csv", sales_engine = nil)
    invoice_items = iir.find_all_by_invoice_id(1)
    assert_equal invoice_items.length, 8
  end

end
