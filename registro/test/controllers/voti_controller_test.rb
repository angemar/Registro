require 'test_helper'

class VotiControllerTest < ActionController::TestCase
  setup do
    @voto = voto(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voto)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voto" do
    assert_difference('Voto.count') do
      post :create, voto: { data: @voto.data, valore: @voto.valore }
    end

    assert_redirected_to voto_path(assigns(:voto))
  end

  test "should show voto" do
    get :show, id: @voto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @voto
    assert_response :success
  end

  test "should update voto" do
    patch :update, id: @voto, voto: { data: @voto.data, valore: @voto.valore }
    assert_redirected_to voto_path(assigns(:voto))
  end

  test "should destroy voto" do
    assert_difference('Voto.count', -1) do
      delete :destroy, id: @voto
    end

    assert_redirected_to voti_path
  end
end
