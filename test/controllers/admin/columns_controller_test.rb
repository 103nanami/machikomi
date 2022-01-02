require 'test_helper'

class Admin::ColumnsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_columns_new_url
    assert_response :success
  end

  test "should get confirm" do
    get admin_columns_confirm_url
    assert_response :success
  end

  test "should get create" do
    get admin_columns_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_columns_show_url
    assert_response :success
  end

end
