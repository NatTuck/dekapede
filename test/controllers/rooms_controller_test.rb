require 'test_helper'

class RoomsControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin)
    @room = rooms(:one)

    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create room" do
    assert_difference('Room.count') do
      post :create, room: { name: "New Room", desc: @room.desc, zone_id: @room.zone_id, 
                            xx: @room.xx, yy: @room.yy, zz: 1, props: @room.props }
    end

    assert_redirected_to room_path(assigns(:room))
  end

  test "should show room" do
    get :show, id: @room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @room
    assert_response :success
  end

  test "should update room" do
    patch :update, id: @room, room: { name: "New Name" }
    assert_redirected_to room_path(assigns(:room))
  end

  test "should destroy room" do
    assert_difference('Room.count', -1) do
      delete :destroy, id: @room
    end

    assert_redirected_to rooms_path
  end
end
