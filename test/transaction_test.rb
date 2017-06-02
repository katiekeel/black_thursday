require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction.rb'
require 'pry'

class TransactionTest < Minitest::Test

  def test_transaction_exists
    transaction = Transaction.new({:id => nil}, transaction_repo = nil)
    assert_instance_of Transaction, transaction
  end

  def test_transaction_has_id
    transaction = Transaction.new({:id => 1}, transaction_repo = nil)
    assert_equal transaction.id, 1
  end

  def test_transaction_invoice_id
    transaction = Transaction.new({:invoice_id => 1}, transaction_repo = nil)
    assert_equal transaction.invoice_id, 1
  end

  def test_transaction_credit_card_number
    transaction = Transaction.new({:credit_card_number => 1}, transaction_repo = nil)
    assert_equal transaction.credit_card_number, 1
  end

  def test_transaction_credit_card_expiration_date
    transaction = Transaction.new({:credit_card_expiration_date => 1}, transaction_repo = nil)
    assert_equal transaction.credit_card_expiration_date, 1
  end

  def test_transaction_result
    transaction = Transaction.new({:result => "success"}, transaction_repo = nil)
    assert_equal transaction.result, "success"
  end

  def test_transaction_created_at
    transaction = Transaction.new({:created_at => 1}, transaction_repo = nil)
    assert_equal transaction.created_at, 1
  end

  def test_transaction_updated_at
    transaction = Transaction.new({:updated_at => 1}, transaction_repo = nil)
    assert_equal transaction.updated_at, 1
  end

end
