class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
    
    @quote[:saying] = @quote[:saying].gsub(/ [A-Z][a-z]+:/, "<br/> - \\0")
    
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end
    redirect_to root_path
  end


  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end

  def about
  end

end
