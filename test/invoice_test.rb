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

end
