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

end
