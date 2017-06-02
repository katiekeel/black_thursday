require_relative 'merchant_repository'
require_relative 'item_repository'
require_relative 'invoice_repository'

class SalesEngine

  attr_reader :merchants, :items, :invoices

  def initialize(item_merchant_hash)
    @items = ItemRepository.new(item_merchant_hash[:items], self)
    @merchants = MerchantRepository.new(item_merchant_hash[:merchants], self)
    @invoices = InvoiceRepository.new(item_merchant_hash[:invoices], self)
  end

  def self.from_csv(item_merchant_hash)
    se = SalesEngine.new(item_merchant_hash)
  end

  def merchant(item_id)
    @merchants.merchant(item_id)
  end

  def sales_engine_items(merchant_id)
    @items.find_all_by_merchant_id(merchant_id)
  end

  def sales_engine_invoices(merchant_id)
    @invoices.find_all_by_merchant_id(merchant_id)
  end
end
