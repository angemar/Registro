require 'test_helper'

class CircolariControllerTest < ActionController::TestCase
  setup do
    @circolare = circolare(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:circolare)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create circolare" do
    assert_difference('Circolare.count') do
      post :create, circolare: { dataemissione: @circolare.dataemissione, numero: @circolare.numero, oggetto: @circolare.oggetto, titolo: @circolare.titolo }
    end

    assert_redirected_to circolare_path(assigns(:circolare))
  end

  test "should show circolare" do
    get :show, id: @circolare
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @circolare
    assert_response :success
  end

  test "should update circolare" do
    patch :update, id: @circolare, circolare: { dataemissione: @circolare.dataemissione, numero: @circolare.numero, oggetto: @circolare.oggetto, titolo: @circolare.titolo }
    assert_redirected_to circolare_path(assigns(:circolare))
  end

  test "should destroy circolare" do
    assert_difference('Circolare.count', -1) do
      delete :destroy, id: @circolare
    end

    assert_redirected_to circolari_path
  end
end
