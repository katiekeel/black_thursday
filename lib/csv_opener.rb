require 'csv'

class CSVOpener

  def initialize(csv_file)
    CSV.open csv_file, headers: true, header_converters: :symbol
  end

end
