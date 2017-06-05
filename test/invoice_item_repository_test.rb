require './test/test_helper'
require './lib/invoice_item_repository'

class InvoiceItemRepositoryTest < Minitest::Test

  def test_invoice_item_repository_exists
    iir = InvoiceItemRepository.new(sales_engine = nil)
    iir.from_csv("./data/invoice_items.csv")
    assert_instance_of InvoiceItemRepository, iir
  end

  def test_populate_invoice_items_repo
    iir = InvoiceItemRepository.new(sales_engine = nil)
    iir.from_csv("./data/invoice_items.csv")
    assert_equal iir.collection.length, 21830
  end

  def test_invoice_item_all
    iir = InvoiceItemRepository.new(sales_engine = nil)
    iir.from_csv("./data/invoice_items.csv")
    assert_instance_of Array, iir.all
  end

  def test_invoice_item_find_by_id
    iir = InvoiceItemRepository.new(sales_engine = nil)
    iir.from_csv("./data/invoice_items.csv")
    invoice_item = iir.find_by_id(1)
    assert_equal invoice_item.id, 1
  end

  def test_invoice_item_find_all_by_item_id
    iir = InvoiceItemRepository.new(sales_engine = nil)
    iir.from_csv("./data/invoice_items.csv")
    invoice_items = iir.find_all_by_item_id(263519844)
    assert_equal invoice_items.length, 164
  end

  def test_invoice_item_find_all_by_invoice_id
    iir = InvoiceItemRepository.new(sales_engine = nil)
    iir.from_csv("./data/invoice_items.csv")
    invoice_items = iir.find_all_by_invoice_id(1)
    assert_equal invoice_items.length, 8
  end

end
