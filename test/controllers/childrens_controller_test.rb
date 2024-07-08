require "test_helper"

class ChildrensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get childrens_index_url
    assert_response :success
  end
end
