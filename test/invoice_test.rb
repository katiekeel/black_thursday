require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice.rb'
require 'pry'

class InvoiceTest < Minitest::Test

  def test_invoice_exists
    invoice = Invoice.new({:id => nil})
    assert_instance_of Invoice, invoice
  end

  def test_invoice_has_an_id
    invoice = Invoice.new({:id => 27})
    assert_equal invoice.id, 27
  end

  def test_invoice_has_a_customer_id
    invoice = Invoice.new({:customer_id => 27})
    assert_equal invoice.customer_id, 27
  end


end
