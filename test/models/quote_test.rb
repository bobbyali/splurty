require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
	test "unique_tag" do
		quote = Quote.create(:author => 'Ken Mazaika', :saying => 'You only yolo once.')
		expected = 'KM#' + quote.id.to_s
		actual = quote.unique_tag
		assert_equal expected, actual
	end
end
