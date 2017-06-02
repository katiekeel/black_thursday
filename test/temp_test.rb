require './lib/merchant_repository'

merchant_repo = MerchantRepository.new("./data/merchants.csv", sales_engine = nil)
merchant_repo.all.first
