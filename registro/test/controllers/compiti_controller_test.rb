require 'test_helper'

class CompitiControllerTest < ActionController::TestCase
  setup do
    @compito = compito(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compito)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compito" do
    assert_difference('Compito.count') do
      post :create, compito: { data: @compito.data, oggetto: @compito.oggetto }
    end

    assert_redirected_to compito_path(assigns(:compito))
  end

  test "should show compito" do
    get :show, id: @compito
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compito
    assert_response :success
  end

  test "should update compito" do
    patch :update, id: @compito, compito: { data: @compito.data, oggetto: @compito.oggetto }
    assert_redirected_to compito_path(assigns(:compito))
  end

  test "should destroy compito" do
    assert_difference('Compito.count', -1) do
      delete :destroy, id: @compito
    end

    assert_redirected_to compiti_path
  end
end
