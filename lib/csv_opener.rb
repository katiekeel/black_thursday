require 'csv'
require_relative 'merchant'
require_relative 'invoice'
require_relative 'item'

class CSVOpener
  attr_reader :holder

  def initialize(csv_file, repo, type)
    @holder = []
    type = type
    if type == "merchant"
      merchant_list = CSV.open csv_file, headers: true, header_converters: :symbol
      merchant_list.each do |row|
        individual = Merchant.new({:id => row[:id], :name => row[:name]}, repo)
        @holder << individual
      end
      merchant_list.close
    elsif type == "item"
      items_list = CSV.open csv_file, headers: true, header_converters: :symbol
      items_list.each do |row|
        item = Item.new({ :id => row[:id], :name => row[:name], :description => row[:description], :unit_price => row[:unit_price], :merchant_id => row[:merchant_id], :created_at => row[:created_at], :updated_at => row[:updated_at]}, repo)
        @holder << item
      end
      items_list.close
    elsif type == "invoice"
      invoices_list = CSV.open csv_file, headers: true, header_converters: :symbol
      invoices_list.each do |row|
        invoice = Invoice.new({:id => row[:id], :customer_id => row[:customer_id], :merchant_id => row[:merchant_id], :status => row[:status], :created_at => row[:created_at], :updated_at => row[:updated_at]}, repo)
        @holder << invoice
      end
      invoices_list.close
    end
    @holder
    # require 'pry' ; binding.pry
  end

end
#
# merchant = CSVOpener.new("./data/merchants.csv", "merchant")
# item = CSVOpener.new("./data/items.csv", "item")
