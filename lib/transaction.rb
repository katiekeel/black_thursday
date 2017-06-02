class Transaction

  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at

  def initialize(transaction_hash, transaction_repo)
    @transaction_repo = transaction_repo
    @id = transaction_hash[:id].to_i
    @invoice_id = transaction_hash[:invoice_id].to_i
    @credit_card_number = transaction_hash[:credit_card_number].to_i
    @credit_card_expiration_date = transaction_hash[:credit_card_expiration_date].to_i
    @result = transaction_hash[:result]
    @created_at = transaction_hash[:created_at]
    @updated_at = transaction_hash[:updated_at]
  end

end

# id - returns the integer id
# invoice_id - returns the invoice id
# credit_card_number - returns the credit card number
# credit_card_expiration_date - returns the credit card expiration date
# result - the transaction result
# created_at - returns a Time instance for the date the transaction was first created
# updated_at - returns a Time instance for the date the transaction was last modified
