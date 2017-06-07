require 'csv'
require 'time'
require_relative 'merchant'
require_relative 'invoice'
require_relative 'item'

class CSVOpener

  attr_reader :holder

  def initialize(csv_file, repo, type)
    @holder = []
    create_class(csv_file, repo, type)
  end

  def create_class(csv_file, repo, type)
    compilation_list =
      CSV.open csv_file, headers: true, header_converters: :symbol

    compilation_list.each do |row|

      if type == "merchant"
        item = Merchant.new({:id => row[:id],
          :name => row[:name]},
          repo)

      elsif type == "item"
        item = Item.new({:id => row[:id],
          :name => row[:name],
          :description => row[:description],
          :unit_price => row[:unit_price],
          :merchant_id => row[:merchant_id],
          :created_at => Time.parse(row[:created_at]),
          :updated_at => Time.parse(row[:updated_at])},
          repo)

      elsif type == "invoice"
        item = Invoice.new({:id => row[:id],
          :customer_id => row[:customer_id],
          :merchant_id => row[:merchant_id],
          :status => row[:status],
          :created_at => Time.parse(row[:created_at]),
          :updated_at => Time.parse(row[:updated_at])},
          repo)

      elsif type == "invoice_item"
        item = InvoiceItem.new({:id => row[:id],
          :item_id => row[:item_id],
          :invoice_id => row[:invoice_id],
          :quantity => row[:quantity],
          :unit_price => row[:unit_price],
          :created_at => Time.parse(row[:created_at]),
          :updated_at => Time.parse(row[:updated_at])},
          repo)

      elsif type == "transaction"
        item = Transaction.new({:id => row[:id],
          :invoice_id => row[:invoice_id],
          :credit_card_number => row[:credit_card_number],
          :credit_card_expiration_date => row[:credit_card_expiration_date],
          :result => row[:result],
          :created_at => Time.parse(row[:created_at]),
          :updated_at => Time.parse(row[:updated_at])},
          repo)

      elsif type == "customer"
        item = Customer.new({:id => row[:id],
          :first_name => row[:first_name],
          :last_name => row[:last_name],
          :created_at => Time.parse(row[:created_at]),
          :updated_at => Time.parse(row[:updated_at])},
          repo)
      end

      item
      @holder << item

    end
    compilation_list.close
  end
end
