class QuotesController < SecuredController

  def show
    symbol = params["filter"]["symbol"].upcase
    query = BasicYahooFinance::Query.new
    data = query.quotes(symbol)[symbol]

    resp_data = {data: [{
      id: 1,
      type: 'quote',
      attributes: {
        symbol: symbol,
        price: data['regularMarketPrice'],
        change: data['regularMarketChange'],
        pctchange: data['regularMarketChangePercent'],
        marketcap: data['marketCap'],
      }
    }]}
    render json: resp_data, status: :ok 
  end

end
