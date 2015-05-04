require 'yahoo-finance'

class CompaniesController < ApplicationController
  HISTORY_TIMESPAN = 30 # days

  before_action :set_company, only: [:show, :prices]

  # GET /companies
  def index
    @companies = Company.by_name(params[:name])
  end

  # GET /companies/1
  # GET /companies/AAPL
  def show
    @prices = YahooFinance.historical_quotes(params[:id], {
      end_date: Date::today,
      period: :daily,
      raw: false,
      start_date: Date::today - HISTORY_TIMESPAN.days,
    }).reverse
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      use_id = params[:id] =~ /\A\d+\Z/
      @company = use_id ? Company.find(params[:id]) : Company.find_by(symbol: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:symbol, :name, :last_sale, :market_cap, :ipo_year, :sector, :industry, :summary_quote)
    end
end
