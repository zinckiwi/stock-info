class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :symbol
      t.string :name
      t.decimal :last_sale
      t.string :market_cap
      t.string :ipo_year
      t.string :sector
      t.string :industry
      t.string :summary_quote

      t.timestamps null: false
    end
  end
end
