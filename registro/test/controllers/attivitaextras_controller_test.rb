require 'test_helper'

class AttivitaextrasControllerTest < ActionController::TestCase
  setup do
    @attivitaextra = attivitaextra(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attivitaextra)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attivitaextra" do
    assert_difference('Attivitaextra.count') do
      post :create, attivitaextra: { datafine: @attivitaextra.datafine, datainizio: @attivitaextra.datainizio, descrizione: @attivitaextra.descrizione, luogo: @attivitaextra.luogo, orafine: @attivitaextra.orafine, orainizio: @attivitaextra.orainizio }
    end

    assert_redirected_to attivitaextra_path(assigns(:attivitaextra))
  end

  test "should show attivitaextra" do
    get :show, id: @attivitaextra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attivitaextra
    assert_response :success
  end

  test "should update attivitaextra" do
    patch :update, id: @attivitaextra, attivitaextra: { datafine: @attivitaextra.datafine, datainizio: @attivitaextra.datainizio, descrizione: @attivitaextra.descrizione, luogo: @attivitaextra.luogo, orafine: @attivitaextra.orafine, orainizio: @attivitaextra.orainizio }
    assert_redirected_to attivitaextra_path(assigns(:attivitaextra))
  end

  test "should destroy attivitaextra" do
    assert_difference('Attivitaextra.count', -1) do
      delete :destroy, id: @attivitaextra
    end

    assert_redirected_to attivitaextras_path
  end
end
