require 'test_helper'

class AssenzeControllerTest < ActionController::TestCase
  setup do
    @assenza = assenza(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assenza)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assenza" do
    assert_difference('Assenza.count') do
      post :create, assenza: { date: @assenza.date }
    end

    assert_redirected_to assenza_path(assigns(:assenza))
  end

  test "should show assenza" do
    get :show, id: @assenza
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assenza
    assert_response :success
  end

  test "should update assenza" do
    patch :update, id: @assenza, assenza: { date: @assenza.date }
    assert_redirected_to assenza_path(assigns(:assenza))
  end

  test "should destroy assenza" do
    assert_difference('Assenza.count', -1) do
      delete :destroy, id: @assenza
    end

    assert_redirected_to assenze_path
  end
end
