require './test/test_helper'
require './lib/sales_items'
require './lib/item_repository'
require './lib/invoice_item_repository'

class SalesItemsTest < Minitest::Test

  include SalesItems

  def setup
    @item_repo = ItemRepository.new("./data/items.csv", sales_engine = nil)
    @invoice_items_repo = InvoiceItemRepository.new(sales_engine = nil)
    @invoice_items_repo.from_csv("./data/invoice_items.csv")
  end

  def test_all
    assert_instance_of Array, @item_repo.all
    assert_equal @item_repo.all.count, 1367
  end

  def test_find_by_id
    assert_instance_of Item, @item_repo.find_by_id(263395237)
    assert_equal @item_repo.find_by_id(263395237).id, 263395237
  end

  def test_find_by_name
    assert_instance_of Item, @item_repo.find_by_name("510+ RealPush Icon Set")
    assert_equal @item_repo.find_by_name("510+ RealPush Icon Set").name, "510+ RealPush Icon Set"
  end

  def test_find_all_by_name
    assert_instance_of Array, @item_repo.find_all_by_merchant_id(12334185)
    assert_equal @item_repo.find_all_by_merchant_id(12334185).first.merchant_id, 12334185
  end

  def test_find_all_by_invoice_id
    assert_instance_of Array, @invoice_items_repo.find_all_by_invoice_id(1)
    assert_equal @invoice_items_repo.find_all_by_invoice_id(1).count, 8
  end

end
