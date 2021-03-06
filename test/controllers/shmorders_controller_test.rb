require 'test_helper'

class ShmordersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shmorder = shmorders(:one)
  end

  test "should get index" do
    get shmorders_url, as: :json
    assert_response :success
  end

  test "should create shmorder" do
    assert_difference('Shmorder.count') do
      post shmorders_url, params: { shmorder: { conversationID: @shmorder.conversationID, cookID: @shmorder.cookID, eaterID: @shmorder.eaterID, orderDay: @shmorder.orderDay, orderTime: @shmorder.orderTime, shmealID: @shmorder.shmealID } }, as: :json
    end

    assert_response 201
  end

  test "should show shmorder" do
    get shmorder_url(@shmorder), as: :json
    assert_response :success
  end

  test "should update shmorder" do
    patch shmorder_url(@shmorder), params: { shmorder: { conversationID: @shmorder.conversationID, cookID: @shmorder.cookID, eaterID: @shmorder.eaterID, orderDay: @shmorder.orderDay, orderTime: @shmorder.orderTime, shmealID: @shmorder.shmealID } }, as: :json
    assert_response 200
  end

  test "should destroy shmorder" do
    assert_difference('Shmorder.count', -1) do
      delete shmorder_url(@shmorder), as: :json
    end

    assert_response 204
  end
end
