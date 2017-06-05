class Invoice

  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at

  def initialize(item_hash, invoices_repo)
    @invoice_repository = invoices_repo
    @id = item_hash[:id].to_i
    @customer_id = item_hash[:customer_id].to_i
    @merchant_id = item_hash[:merchant_id].to_i
    @status = item_hash[:status].to_sym
    @created_at = item_hash[:created_at]
    @updated_at = item_hash[:updated_at]
  end

  def merchant
    @invoice_repository.invoice_repo_merchant(@merchant_id)
  end

  def invoice_items
    @invoice_repository.find_invoice_items(@id)
  end

  def items
    @invoice_repository.find_all_items_by_invoice_id(@id)
  end

  def transactions
    @invoice_repository.find_transaction_with_id(@id)
  end

  def customer
    @invoice_repository.customer(@customer_id)
  end

  def is_paid_in_full?
    @invoice_repository.is_paid_in_full?(@id)
  end

  def total
    @invoice_repository.total(@id)
  end

end
