require 'simplecov'
SimpleCov.start
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction_repository.rb'
require 'pry'

class TransactionRepositoryTest < Minitest::Test

  def test_transaction_repo_exists
    tr = TransactionRepository.new("./data/transactions.csv", sales_engine = nil)
    assert_instance_of TransactionRepository, tr
  end

  def test_transaction_repo_is_populated
    tr = TransactionRepository.new("./data/transactions.csv", sales_engine = nil)
    assert_equal tr.collection.length, 4985
  end

  def test_transaction_repo_all
    tr = TransactionRepository.new("./data/transactions.csv", sales_engine = nil)
    assert_instance_of Array, tr.all
  end

  def test_transaction_repo_find_by_id
    tr = TransactionRepository.new("./data/transactions.csv", sales_engine = nil)
    transaction = tr.find_by_id(1)
    assert_equal transaction.id, 1
  end

  def test_find_all_by_invoice_id
    tr = TransactionRepository.new("./data/transactions.csv", sales_engine = nil)
    transactions = tr.find_all_by_invoice_id(1)
    assert_equal transactions.length, 2
  end

  def test_transaction_find_all_by_credit_card_number
    tr = TransactionRepository.new("./data/transactions.csv", sales_engine = nil)
    transactions = tr.find_all_by_credit_card_number(4772428113593836)
    assert_equal transactions.length, 1
  end

  def test_transaction_find_all_by_result
    tr = TransactionRepository.new("./data/transactions.csv", sales_engine = nil)
    transactions = tr.find_all_by_result("failed")
    assert_equal transactions.length, 827
  end

end
