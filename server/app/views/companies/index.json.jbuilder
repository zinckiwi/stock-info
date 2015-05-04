json.companies do
  json.array!(@companies) do |company|
    json.id company.symbol # treat symbol as pk
    json.extract! company, :symbol, :name, :last_sale, :market_cap, :ipo_year, :sector, :industry, :summary_quote
    json.url company_url(company, format: :json)
  end
end
