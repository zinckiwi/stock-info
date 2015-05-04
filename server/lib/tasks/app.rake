require 'csv'

namespace :app do

  HEADER_MAP = {
    "Symbol" => :symbol,
    "Name" => :name,
    "LastSale" => :last_sale,
    "MarketCap" => :market_cap,
    "IPOyear" => :ipo_year,
    "Sector" => :sector,
    "industry" => :industry,
    "Summary Quote" => :summary_quote,
  }
  IMPORT_PATH = 'lib/resources/companies'

  def import_file(file_path)
    csv = CSV.open(file_path,
      headers: true,
      header_converters: lambda { |h| HEADER_MAP[h] }
    )
    hashes = csv.map(&:to_h)
    Company.create(hashes)
  end

  def import_dir(dir_path)
    Dir.glob("#{dir_path}/*.csv") do |file_path|
      import_file(file_path)
    end
  end

  desc "Imports the CSV data found in #{IMPORT_PATH}"
  task import_companies: :environment do
    import_dir(IMPORT_PATH)
  end

end
