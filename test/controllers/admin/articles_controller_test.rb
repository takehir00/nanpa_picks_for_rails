require 'test_helper'

class Admin::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admin_articles_top_url
    assert_response :success
  end

  test "should get index" do
    get admin_articles_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_articles_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_articles_edit_url
    assert_response :success
  end

end
