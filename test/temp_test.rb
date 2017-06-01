require './lib/merchant_repository'

merchant_repo = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)

p merchant_repo.find_all_by_name("justMstyle")
puts merchant_repo.find_all_by_name("justMstyle").include?("justMStyle")
