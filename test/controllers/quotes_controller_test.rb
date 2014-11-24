require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
	test "quote show page"  do
		quote = Quote.create(:author => 'Ken Mazaika', :saying => 'You only yolo once.')
		get :show, :id => quote.id
		assert_response :success		
	end

	test "quote show page, not found" do 
		get :show, :id => 'OMG'
		assert_response :not_found
	end
end
