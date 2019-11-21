require 'test_helper'

class BbsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bbs_index_url
    assert_response :success
  end

  test "should get show" do
    get bbs_show_url
    assert_response :success
  end

  test "should get new" do
    get bbs_new_url
    assert_response :success
  end

  test "should get edit" do
    get bbs_edit_url
    assert_response :success
  end

end
