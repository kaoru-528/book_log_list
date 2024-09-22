require "test_helper"

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  
  test "create should require logged-in user" do
    # 第1引数に渡したメソッドの値が、ブロック内で変更されることを検証します。
    # 第2引数に変更される期待値を渡します。省略した場合は"+1"が期待値になります。
    assert_no_difference 'Relationship.count' do
      post relationships_path
    end
    assert_redirected_to login_url
  end

  test "destroy should require logged-in user" do
    assert_no_difference 'Relationship.count' do
      delete relationship_path(relationships(:one))
    end
    assert_redirected_to login_url
  end
end
