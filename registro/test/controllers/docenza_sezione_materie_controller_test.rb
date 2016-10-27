require 'test_helper'

class DocenzaSezioneMaterieControllerTest < ActionController::TestCase
  setup do
    @docenza_sezione_materia = docenza_sezione_materia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:docenza_sezione_materia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create docenza_sezione_materia" do
    assert_difference('DocenzaSezioneMateria.count') do
      post :create, docenza_sezione_materia: { docenza_id: @docenza_sezione_materia.docenza_id, materia_id: @docenza_sezione_materia.materia_id, sezione_id: @docenza_sezione_materia.sezione_id }
    end

    assert_redirected_to docenza_sezione_materia_path(assigns(:docenza_sezione_materia))
  end

  test "should show docenza_sezione_materia" do
    get :show, id: @docenza_sezione_materia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @docenza_sezione_materia
    assert_response :success
  end

  test "should update docenza_sezione_materia" do
    patch :update, id: @docenza_sezione_materia, docenza_sezione_materia: { docenza_id: @docenza_sezione_materia.docenza_id, materia_id: @docenza_sezione_materia.materia_id, sezione_id: @docenza_sezione_materia.sezione_id }
    assert_redirected_to docenza_sezione_materia_path(assigns(:docenza_sezione_materia))
  end

  test "should destroy docenza_sezione_materia" do
    assert_difference('DocenzaSezioneMateria.count', -1) do
      delete :destroy, id: @docenza_sezione_materia
    end

    assert_redirected_to docenza_sezione_materie_path
  end
end
