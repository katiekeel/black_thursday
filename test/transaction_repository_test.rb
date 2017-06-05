require './test/test_helper'
require './lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test

  def test_transaction_repo_exists
    tr = TransactionRepository.new(sales_engine = nil)
    tr.from_csv("./data/transactions.csv")
    assert_instance_of TransactionRepository, tr
  end

  def test_transaction_repo_is_populated
    tr = TransactionRepository.new(sales_engine = nil)
    tr.from_csv("./data/transactions.csv")
    assert_equal tr.collection.count, 4985
  end

  def test_transaction_repo_all
    tr = TransactionRepository.new(sales_engine = nil)
    tr.from_csv("./data/transactions.csv")
    assert_instance_of Array, tr.all
  end

  def test_transaction_repo_find_by_id
    tr = TransactionRepository.new(sales_engine = nil)
    tr.from_csv("./data/transactions.csv")
    transaction = tr.find_by_id(1)
    assert_equal transaction.id, 1
  end

  def test_transaction_repo_find_by_id_with_nil
    tr = TransactionRepository.new(sales_engine = nil)
    tr.from_csv("./data/transactions.csv")
    transaction = tr.find_by_id(23847394772984384)
    assert_nil transaction
  end

  def test_find_all_by_invoice_id
    tr = TransactionRepository.new(sales_engine = nil)
    tr.from_csv("./data/transactions.csv")
    transactions = tr.find_all_by_invoice_id(1)
    assert_equal transactions.count, 2
  end

  def test_find_all_by_invoice_id_empty
    tr = TransactionRepository.new(sales_engine = nil)
    tr.from_csv("./data/transactions.csv")
    transactions = tr.find_all_by_invoice_id(49723472398497)
    assert_empty transactions
  end

  def test_transaction_find_all_by_credit_card_number
    tr = TransactionRepository.new(sales_engine = nil)
    tr.from_csv("./data/transactions.csv")
    transactions = tr.find_all_by_credit_card_number(4772428113593836)
    assert_equal transactions.count, 1
  end

  def test_transaction_find_all_by_credit_card_number_empty
    tr = TransactionRepository.new(sales_engine = nil)
    tr.from_csv("./data/transactions.csv")
    transactions = tr.find_all_by_credit_card_number(14878619283987284)
    assert_empty transactions
  end

  def test_transaction_find_all_by_result
    tr = TransactionRepository.new(sales_engine = nil)
    tr.from_csv("./data/transactions.csv")
    transactions = tr.find_all_by_result("failed")
    assert_equal transactions.count, 827
  end

  def test_transaction_find_all_by_result_empty
    tr = TransactionRepository.new(sales_engine = nil)
    tr.from_csv("./data/transactions.csv")
    transactions = tr.find_all_by_result("cats!")
    assert_empty transactions
  end


end
