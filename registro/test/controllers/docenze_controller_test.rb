require 'test_helper'

class DocenzeControllerTest < ActionController::TestCase
  setup do
    @docenza = docenza(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:docenza)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create docenza" do
    assert_difference('Docenza.count') do
      post :create, docenza: { cf: @docenza.cf, cittanascita: @docenza.cittanascita, cittaresidenza: @docenza.cittaresidenza, cognome: @docenza.cognome, datanascita: @docenza.datanascita, email: @docenza.email, indirizzo: @docenza.indirizzo, nome: @docenza.nome, password: @docenza.password }
    end

    assert_redirected_to docenza_path(assigns(:docenza))
  end

  test "should show docenza" do
    get :show, id: @docenza
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @docenza
    assert_response :success
  end

  test "should update docenza" do
    patch :update, id: @docenza, docenza: { cf: @docenza.cf, cittanascita: @docenza.cittanascita, cittaresidenza: @docenza.cittaresidenza, cognome: @docenza.cognome, datanascita: @docenza.datanascita, email: @docenza.email, indirizzo: @docenza.indirizzo, nome: @docenza.nome, password: @docenza.password }
    assert_redirected_to docenza_path(assigns(:docenza))
  end

  test "should destroy docenza" do
    assert_difference('Docenza.count', -1) do
      delete :destroy, id: @docenza
    end

    assert_redirected_to docenze_path
  end
end
