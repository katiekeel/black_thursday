require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice.rb'
require 'pry'

class InvoiceTest < Minitest::Test

  def test_invoice_exists
    invoice = Invoice.new({:id => nil}, invoices_repo = nil)
    assert_instance_of Invoice, invoice
  end

  def test_invoice_has_an_id
    invoice = Invoice.new({:id => 27}, invoices_repo = nil)
    assert_equal invoice.id, 27
  end

  def test_invoice_has_a_customer_id
    invoice = Invoice.new({:customer_id => 27}, invoices_repo = nil)
    assert_equal invoice.customer_id, 27
  end

  def test_invoice_has_a_merchant_id
    invoice = Invoice.new({:merchant_id => 27}, invoices_repo = nil)
    assert_equal invoice.merchant_id, 27
  end

  def test_invoice_has_a_status
    invoice = Invoice.new({:status => "pending"}, invoices_repo = nil)
    assert_equal invoice.status, "pending"
  end

  def test_invoice_has_a_create_date
    time = Time.now
    invoice = Invoice.new({:created_at => time}, invoices_repo = nil)
    assert_equal invoice.created_at, time
  end

  def test_invoice_has_an_update_date
    time = Time.now
    invoice = Invoice.new({:updated_at => time}, invoices_repo = nil)
    assert_equal invoice.updated_at, time
  end


end
