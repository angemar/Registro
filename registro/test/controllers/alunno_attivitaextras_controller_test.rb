require 'test_helper'

class AlunnoAttivitaextrasControllerTest < ActionController::TestCase
  setup do
    @alunno_attivitaextra = alunno_attivitaextra(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alunno_attivitaextra)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alunno_attivitaextra" do
    assert_difference('AlunnoAttivitaextra.count') do
      post :create, alunno_attivitaextra: { alunno_id: @alunno_attivitaextra.alunno_id, attivitaextra_id: @alunno_attivitaextra.attivitaextra_id, partecipazione: @alunno_attivitaextra.partecipazione }
    end

    assert_redirected_to alunno_attivitaextra_path(assigns(:alunno_attivitaextra))
  end

  test "should show alunno_attivitaextra" do
    get :show, id: @alunno_attivitaextra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @alunno_attivitaextra
    assert_response :success
  end

  test "should update alunno_attivitaextra" do
    patch :update, id: @alunno_attivitaextra, alunno_attivitaextra: { alunno_id: @alunno_attivitaextra.alunno_id, attivitaextra_id: @alunno_attivitaextra.attivitaextra_id, partecipazione: @alunno_attivitaextra.partecipazione }
    assert_redirected_to alunno_attivitaextra_path(assigns(:alunno_attivitaextra))
  end

  test "should destroy alunno_attivitaextra" do
    assert_difference('AlunnoAttivitaextra.count', -1) do
      delete :destroy, id: @alunno_attivitaextra
    end

    assert_redirected_to alunno_attivitaextras_path
  end
end
