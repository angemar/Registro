require 'test_helper'

class NotedisciplinariControllerTest < ActionController::TestCase
  setup do
    @notadisciplinare = notadisciplinare(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notadisciplinare)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notadisciplinare" do
    assert_difference('Notadisciplinare.count') do
      post :create, notadisciplinare: { data: @notadisciplinare.data, oggetto: @notadisciplinare.oggetto }
    end

    assert_redirected_to notadisciplinare_path(assigns(:notadisciplinare))
  end

  test "should show notadisciplinare" do
    get :show, id: @notadisciplinare
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notadisciplinare
    assert_response :success
  end

  test "should update notadisciplinare" do
    patch :update, id: @notadisciplinare, notadisciplinare: { data: @notadisciplinare.data, oggetto: @notadisciplinare.oggetto }
    assert_redirected_to notadisciplinare_path(assigns(:notadisciplinare))
  end

  test "should destroy notadisciplinare" do
    assert_difference('Notadisciplinare.count', -1) do
      delete :destroy, id: @notadisciplinare
    end

    assert_redirected_to notedisciplinari_path
  end
end
