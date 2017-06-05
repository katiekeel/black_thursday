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
    assert_equal iir.collection.count, 21830
  end

  def test_invoice_item_repository_all
    iir = InvoiceItemRepository.new(sales_engine = nil)
    iir.from_csv("./data/invoice_items.csv")
    assert_instance_of Array, iir.all
    assert_equal iir.all.count, 21830
  end

  def test_invoice_item_repository_find_by_id
    iir = InvoiceItemRepository.new(sales_engine = nil)
    iir.from_csv("./data/invoice_items.csv")
    invoice_item = iir.find_by_id(1)
    assert_equal invoice_item.id, 1
  end

  def test_invoice_item_repository_find_by_id_with_nil
    iir = InvoiceItemRepository.new(sales_engine = nil)
    iir.from_csv("./data/invoice_items.csv")
    invoice_item = iir.find_by_id(834957927498734)
    assert_nil invoice_item
  end

  def test_invoice_item_repository_find_all_by_item_id
    iir = InvoiceItemRepository.new(sales_engine = nil)
    iir.from_csv("./data/invoice_items.csv")
    invoice_items = iir.find_all_by_item_id(263519844)
    assert_equal invoice_items.count, 164
  end

  def test_invoice_item_repository_find_all_by_item_id_empty
    iir = InvoiceItemRepository.new(sales_engine = nil)
    iir.from_csv("./data/invoice_items.csv")
    invoice_items = iir.find_all_by_item_id(3895587674980859743985)
    assert_empty invoice_items
  end

  def test_invoice_item_repository_find_all_by_invoice_id
    iir = InvoiceItemRepository.new(sales_engine = nil)
    iir.from_csv("./data/invoice_items.csv")
    invoice_items = iir.find_all_by_invoice_id(1)
    assert_equal invoice_items.count, 8
  end

  def test_invoice_item_repository_find_all_by_invoice_id_empty
    iir = InvoiceItemRepository.new(sales_engine = nil)
    iir.from_csv("./data/invoice_items.csv")
    invoice_items = iir.find_all_by_invoice_id(495868716834222343242)
    assert_empty invoice_items
  end

  def test_invoice_item_repository_invoice_total
    iir = InvoiceItemRepository.new(sales_engine = nil)
    iir.from_csv("./data/invoice_items.csv")
    invoice_total = iir.total(1)
    assert_equal invoice_total, 21067.77
  end


end
