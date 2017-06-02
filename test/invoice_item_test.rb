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
end
