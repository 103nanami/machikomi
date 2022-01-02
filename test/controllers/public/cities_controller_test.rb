require 'test_helper'

class Public::CitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_cities_index_url
    assert_response :success
  end

end
