json.company do
  json.id @company.symbol # treat symbol as pk
  json.extract! @company, :symbol, :name, :last_sale, :market_cap, :ipo_year, :sector, :industry, :summary_quote, :created_at, :updated_at
  json.prices do
    json.array!(@prices) do |item|
      json.id item.trade_date
      json.extract! item, :trade_date, :open, :high, :low, :close, :volume, :adjusted_close
    end
  end
end
