require 'test_helper'

class AmministrazioniControllerTest < ActionController::TestCase
  setup do
    @amministrazione = amministrazione(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:amministrazione)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create amministrazione" do
    assert_difference('Amministrazione.count') do
      post :create, amministrazione: { cf: @amministrazione.cf, cittanascita: @amministrazione.cittanascita, cittaresidenza: @amministrazione.cittaresidenza, cognome: @amministrazione.cognome, datanascita: @amministrazione.datanascita, email: @amministrazione.email, indirizzo: @amministrazione.indirizzo, nome: @amministrazione.nome, password: @amministrazione.password, titolo: @amministrazione.titolo }
    end

    assert_redirected_to amministrazione_path(assigns(:amministrazione))
  end

  test "should show amministrazione" do
    get :show, id: @amministrazione
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @amministrazione
    assert_response :success
  end

  test "should update amministrazione" do
    patch :update, id: @amministrazione, amministrazione: { cf: @amministrazione.cf, cittanascita: @amministrazione.cittanascita, cittaresidenza: @amministrazione.cittaresidenza, cognome: @amministrazione.cognome, datanascita: @amministrazione.datanascita, email: @amministrazione.email, indirizzo: @amministrazione.indirizzo, nome: @amministrazione.nome, password: @amministrazione.password, titolo: @amministrazione.titolo }
    assert_redirected_to amministrazione_path(assigns(:amministrazione))
  end

  test "should destroy amministrazione" do
    assert_difference('Amministrazione.count', -1) do
      delete :destroy, id: @amministrazione
    end

    assert_redirected_to amministrazioni_path
  end
end
