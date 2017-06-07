require './test/test_helper'
require './lib/transaction'

class TransactionTest < Minitest::Test

  def test_transaction_exists
    transaction = Transaction.new({:id => nil}, transaction_repo = nil)
    assert_instance_of Transaction, transaction
  end

  def test_transaction_has_id
    transaction = Transaction.new({:id => 1}, transaction_repo = nil)
    assert_equal transaction.id, 1
  end

  def test_transaction_id_is_integer
    transaction = Transaction.new({:id => 1}, transaction_repo = nil)
    assert_instance_of Integer, transaction.id
  end

  def test_transaction_invoice_id
    transaction = Transaction.new({:invoice_id => 1}, transaction_repo = nil)
    assert_equal transaction.invoice_id, 1
  end

  def test_transaction_invoice_id_is_integer
    transaction = Transaction.new({:invoice_id => 1}, transaction_repo = nil)
    assert_instance_of Integer, transaction.invoice_id
  end

  def test_transaction_credit_card_number
    transaction = Transaction.new({:credit_card_number => 1}, transaction_repo = nil)
    assert_equal transaction.credit_card_number, 1
  end

  def test_transaction_credit_card_number_is_integer
    transaction = Transaction.new({:credit_card_number => 1}, transaction_repo = nil)
    assert_instance_of Integer, transaction.credit_card_number
  end

  def test_transaction_credit_card_expiration_date
    transaction = Transaction.new({:credit_card_expiration_date => "0537"}, transaction_repo = nil)
    assert_equal transaction.credit_card_expiration_date, "0537"
  end

  def test_transaction_credit_card_expiration_date_is_string
    transaction = Transaction.new({:credit_card_expiration_date => "0537"}, transaction_repo = nil)
    assert_instance_of String, transaction.credit_card_expiration_date
  end

  def test_transaction_result
    transaction = Transaction.new({:result => "success"}, transaction_repo = nil)
    assert_equal transaction.result, "success"
  end

  def test_transaction_result_is_string
    transaction = Transaction.new({:result => "success"}, transaction_repo = nil)
    assert_instance_of String, transaction.result
  end

  def test_transaction_created_at
    time = Time.now
    transaction = Transaction.new({:created_at => time}, transaction_repo = nil)
    assert_equal transaction.created_at, time
  end

  def test_transaction_created_at_is_time
    time = Time.now
    transaction = Transaction.new({:created_at => time}, transaction_repo = nil)
    assert_instance_of Time, transaction.created_at
  end

  def test_transaction_updated_at
    transaction = Transaction.new({:updated_at => 1}, transaction_repo = nil)
    assert_equal transaction.updated_at, 1
  end

  def test_transaction_updated_at_is_time
    time = Time.now
    transaction = Transaction.new({:updated_at => time}, transaction_repo = nil)
    assert_instance_of Time, transaction.updated_at
  end

end
