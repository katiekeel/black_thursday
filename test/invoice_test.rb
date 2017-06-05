require './test/test_helper'
require './lib/invoice'

class InvoiceTest < Minitest::Test

  def test_invoice_exists
    invoice = Invoice.new({:id => nil, :customer_id => 2, :merchant_id => 3, :status => "pending", :created_at => Time.now, :updated_at => Time.now}, invoices_repo = nil)
    assert_instance_of Invoice, invoice
  end

  def test_invoice_has_an_id
    invoice = Invoice.new({:id => 1, :customer_id => 2, :merchant_id => 3, :status => "pending", :created_at => Time.now, :updated_at => Time.now}, invoices_repo = nil)
    assert_equal invoice.id, 1
  end

  def test_invoice_id_is_integer
    invoice = Invoice.new({:id => 1, :customer_id => 2, :merchant_id => 3, :status => "pending", :created_at => Time.now, :updated_at => Time.now}, invoices_repo = nil)
    assert_instance_of Integer, invoice.id
  end

  def test_invoice_has_a_customer_id
    invoice = Invoice.new({:id => nil, :customer_id => 2, :merchant_id => 3, :status => "pending", :created_at => Time.now, :updated_at => Time.now}, invoices_repo = nil)
    assert_equal invoice.customer_id, 2
  end

  def test_invoice_customer_id_is_integer
    invoice = Invoice.new({:id => 1, :customer_id => 2, :merchant_id => 3, :status => "pending", :created_at => Time.now, :updated_at => Time.now}, invoices_repo = nil)
    assert_instance_of Integer, invoice.customer_id
  end

  def test_invoice_has_a_merchant_id
    invoice = Invoice.new({:id => nil, :customer_id => 2, :merchant_id => 3, :status => "pending", :created_at => Time.now, :updated_at => Time.now}, invoices_repo = nil)
    assert_equal invoice.merchant_id, 3
  end

  def test_invoice_merchant_id_is_integer
    invoice = Invoice.new({:id => 1, :customer_id => 2, :merchant_id => 3, :status => "pending", :created_at => Time.now, :updated_at => Time.now}, invoices_repo = nil)
    assert_instance_of Integer, invoice.merchant_id
  end

  def test_invoice_has_a_status
    invoice = Invoice.new({:id => nil, :customer_id => 2, :merchant_id => 3, :status => "pending", :created_at => Time.now, :updated_at => Time.now}, invoices_repo = nil)
    assert_equal invoice.status, :pending
  end

  def test_invoice_status_is_symbol
    invoice = Invoice.new({:id => 1, :customer_id => 2, :merchant_id => 3, :status => "pending", :created_at => Time.now, :updated_at => Time.now}, invoices_repo = nil)
    assert_instance_of Symbol, invoice.status
  end

  def test_invoice_has_a_create_date
    time = Time.now
    invoice = Invoice.new({:id => nil, :customer_id => 2, :merchant_id => 3, :status => "pending", :created_at => time, :updated_at => time}, invoices_repo = nil)
    assert_equal invoice.created_at, time
  end

  def test_invoice_create_date_is_time
    time = Time.now
    invoice = Invoice.new({:id => nil, :customer_id => 2, :merchant_id => 3, :status => "pending", :created_at => time, :updated_at => time}, invoices_repo = nil)
    assert_instance_of Time, invoice.created_at
  end

  def test_invoice_has_an_update_date
    time = Time.now
    invoice = Invoice.new({:id => nil, :customer_id => 2, :merchant_id => 3, :status => "pending", :created_at => time, :updated_at => time}, invoices_repo = nil)
    assert_equal invoice.updated_at, time
  end

  def test_invoice_update_date_is_time
    time = Time.now
    invoice = Invoice.new({:id => nil, :customer_id => 2, :merchant_id => 3, :status => "pending", :created_at => time, :updated_at => time}, invoices_repo = nil)
    assert_instance_of Time, invoice.updated_at
  end

  def test_invoice_carries_invoice_repo
    invoice = Invoice.new({:id => nil, :customer_id => 2, :merchant_id => 3, :status => "pending", :created_at => time, :updated_at => time}, invoices_repo = nil)
    assert_nil invoice.invoice_repository
  end

end
