require_relative 'merchant_repository'
require_relative 'item_repository'
require_relative 'invoice_repository'
require_relative 'invoice_item_repository'
require_relative 'customer_repository'
require_relative 'transaction_repository'

class SalesEngine

  attr_reader :merchants, :items, :invoices, :invoice_items, :transactions, :customers

  def initialize(item_merchant_hash)
    @items = ItemRepository.new(item_merchant_hash[:items], self)
    @merchants = MerchantRepository.new(item_merchant_hash[:merchants], self)
    @invoices = InvoiceRepository.new(item_merchant_hash[:invoices], self)
    @invoice_items = InvoiceItemRepository.new(item_merchant_hash[:invoice_items], self)
    @transactions = TransactionRepository.new(item_merchant_hash[:transactions], self)
    @customers = CustomerRepository.new(item_merchant_hash[:customers], self)
  end

  def self.from_csv(item_merchant_hash)
    se = SalesEngine.new(item_merchant_hash)
  end

  def sales_engine_merchant(merchant_id)
    @merchants.merchant_repo_merchant(merchant_id)
  end

  def sales_engine_items(merchant_id)
    @items.find_all_by_merchant_id(merchant_id)
  end

  def sales_engine_invoices(merchant_id)
    @invoices.find_all_by_merchant_id(merchant_id)
  end

  def sales_engine_customers(merchant_id)
    @customers.find_all_by_merchant_id(merchant_id)
  end

  def sales_engine_items_by_invoice_id(invoice_id)
    @items.find_all_by_invoice_id(invoice_id)
  end

  def sale_engine_invoice_items_item_ids(invoice_id)
    @invoice_items.find_all_item_ids_by_invoice_id(invoice_id)
  end

  def invoice_paid_in_full?(id)
    @transactions.paid_in_full?(id)
  end

  def total(id)
    @invoice_items.total(id)
  end

  def sales_engine_find_customers(merchant_id)
    @invoices.find_customers(merchant_id)
  end

  def find_customers(customers)
    @customers.find_customers_by_id(customers)
  end

  def is_paid_in_full?(invoice_id)
    @transactions.is_paid_in_full?(invoice_id)
  end

  def customer(customer_id)
    @customers.find_by_id(customer_id)
  end

  def find_all_items_by_invoices(invoices)
    @invoice_items.find_all_items_by_invoices(invoices)
  end
end
