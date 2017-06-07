require './test/test_helper'
require './lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test

  def test_invoice_repository_exists
    invoices = InvoiceRepository.new('./data/invoices.csv', sales_engine = nil)
    assert_instance_of InvoiceRepository, invoices
  end

  def test_invoice_repository_can_be_populated
    invoices = InvoiceRepository.new('./data/invoices.csv', sales_engine = nil)
    assert_instance_of InvoiceRepository, invoices
  end

  def test_all
    invoices = InvoiceRepository.new('./data/invoices.csv', sales_engine = nil)
    assert_equal invoices.all.count, 4985
  end

  def test_find_by_id
    invoices = InvoiceRepository.new('./data/invoices.csv', sales_engine = nil)
    invoice = invoices.find_by_id(1)
    assert_equal invoice.id, 1
  end

  def test_find_by_id_with_nil
    invoices = InvoiceRepository.new('./data/invoices.csv', sales_engine = nil)
    invoice = invoices.find_by_id(1946238647137432)
    assert_nil invoice
  end

  def test_find_all_by_customer_id
    invoices = InvoiceRepository.new('./data/invoices.csv', sales_engine = nil)
    invoice = invoices.find_all_by_customer_id(1)
    assert_equal invoice.count, 8
  end

  def test_find_all_by_customer_id_with_nil
    invoices = InvoiceRepository.new('./data/invoices.csv', sales_engine = nil)
    invoice = invoices.find_all_by_customer_id(91287398217897194798)
    assert_empty invoice
  end

  def test_find_all_by_merchant_id
    invoices = InvoiceRepository.new('./data/invoices.csv', sales_engine = nil)
    invoice = invoices.find_all_by_merchant_id(12335938)
    assert_equal invoice.count, 16
  end

  def test_find_all_by_merchant_id_with_nil
    invoices = InvoiceRepository.new('./data/invoices.csv', sales_engine = nil)
    invoice = invoices.find_all_by_merchant_id(1294785628294028494308)
    assert_empty invoice
  end

  def test_find_all_by_status_shipped
    invoices = InvoiceRepository.new('./data/invoices.csv', sales_engine = nil)
    invoice = invoices.find_all_by_status(:shipped)
    assert_equal invoice.count, 2839
  end

  def test_find_all_by_status_pending
    invoices = InvoiceRepository.new('./data/invoices.csv', sales_engine = nil)
    invoice = invoices.find_all_by_status(:pending)
    assert_equal invoice.count, 1473
  end

  def test_find_all_by_status_returned
    invoices = InvoiceRepository.new('./data/invoices.csv', sales_engine = nil)
    invoice = invoices.find_all_by_status(:returned)
    assert_equal invoice.count, 673
  end

  def test_find_all_by_status_with_nil
    invoices = InvoiceRepository.new('./data/invoices.csv', sales_engine = nil)
    invoice = invoices.find_all_by_status("cats!")
    assert_empty invoice
  end

end
