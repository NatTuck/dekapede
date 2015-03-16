require 'test_helper'

class CharactersControllerTest < ActionController::TestCase
  setup do
    @admin = users(:admin)
    @user = users(:one)
    @character = characters(:one)
  end

  test "should get index" do
    sign_in @admin

    get :index
    assert_response :success
    assert_not_nil assigns(:characters)
  end

  test "should get new" do
    sign_in @user

    get :new
    assert_response :success
  end

  test "should create character" do
    sign_in @user

    assert_difference('Character.count') do
      post :create, character: { name: @character.name, user_id: @character.user_id }
    end

    assert_redirected_to character_path(assigns(:character))
  end

  test "should show character" do
    sign_in @user

    get :show, id: @character
    assert_response :success
  end

  test "should get edit" do
    sign_in @user

    get :edit, id: @character
    assert_response :success
  end

  test "should update character" do
    sign_in @user

    patch :update, id: @character, character: { name: "Frank" }
    assert_redirected_to character_path(assigns(:character))
  end

  test "should destroy character" do
    sign_in @user

    assert_difference('Character.count', -1) do
      delete :destroy, id: @character
    end

    assert_redirected_to characters_path
  end
end
