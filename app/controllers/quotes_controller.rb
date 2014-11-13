class QuotesController < ApplicationController
  
  # index page shows a random quote and also puts line breaks after each
  # name starting with a capital and ending with a colon (e.g. Adam:)
  def index
    @quote = Quote.order("RANDOM()").first    
    @quote[:saying] = @quote[:saying].gsub(/ [A-Z][a-z]+:/, "<br/> - \\0")
    @total_number_quotes = Quote.count    
  end

  # create a new quote using the modal form input
  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end
    redirect_to root_path
  end


  private

    # safely handle input form fields
    def quote_params
      params.require(:quote).permit(:saying, :author)
    end

    def about
    end

end
