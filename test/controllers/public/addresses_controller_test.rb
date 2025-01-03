require "test_helper"

class Public::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_addresses_new_url
    assert_response :success
  end

  test "should get create" do
    get public_addresses_create_url
    assert_response :success
  end

  test "should get index" do
    get public_addresses_index_url
    assert_response :success
  end

  test "should get show" do
    get public_addresses_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_addresses_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_addresses_update_url
    assert_response :success
  end

  test "should get destoroy" do
    get public_addresses_destoroy_url
    assert_response :success
  end
end
