require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_article_url
    assert_response :success
  end
end
