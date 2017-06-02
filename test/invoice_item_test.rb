require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item.rb'
require 'pry'

class InvoiceItemTest < Minitest::Test

  def test_invoice_item_exists
    invoice_item = InvoiceItem.new({:id => 1}, invoice_item_repo = nil)
    assert_instance_of InvoiceItem, invoice_item
  end

  def test_invoice_item_id
    invoice_item = InvoiceItem.new({:id => 1}, invoice_item_repo = nil)
    assert_equal invoice_item.id, 1
  end

  def test_invoice_item_item_id
    invoice_item = InvoiceItem.new({:item_id => 1}, invoice_item_repo = nil)
    assert_equal invoice_item.item_id, 1
  end

  def test_invoice_item_invoice_id
    invoice_item = InvoiceItem.new({:invoice_id => 1}, invoice_item_repo = nil)
    assert_equal invoice_item.invoice_id, 1
  end

  def test_invoice_item_quantity
    invoice_item = InvoiceItem.new({:quantity => 1}, invoice_item_repo = nil)
    assert_equal invoice_item.quantity, 1
  end

  def test_invoice_item_unit_price
    invoice_item = InvoiceItem.new({:unit_price => 1}, invoice_item_repo = nil)
    assert_equal invoice_item.unit_price, 1
  end

  def test_invoice_item_created_at
    time = Time.now
    invoice_item = InvoiceItem.new({:created_at => time}, invoice_item_repo = nil)
    assert_equal invoice_item.created_at, time
  end

  def test_invoice_item_updated_at
    time = Time.now
    invoice_item = InvoiceItem.new({:updated_at => time}, invoice_item_repo = nil)
    assert_equal invoice_item.updated_at, time
  end

end
