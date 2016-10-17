require 'test_helper'

class AlunniControllerTest < ActionController::TestCase
  setup do
    @alunno = alunno(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alunno)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alunno" do
    assert_difference('Alunno.count') do
      post :create, alunno: { cf: @alunno.cf, cittanascita: @alunno.cittanascita, cittaresidenza: @alunno.cittaresidenza, cognome: @alunno.cognome, datanascita: @alunno.datanascita, email: @alunno.email, indirizzo: @alunno.indirizzo, nome: @alunno.nome, password: @alunno.password }
    end

    assert_redirected_to alunno_path(assigns(:alunno))
  end

  test "should show alunno" do
    get :show, id: @alunno
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @alunno
    assert_response :success
  end

  test "should update alunno" do
    patch :update, id: @alunno, alunno: { cf: @alunno.cf, cittanascita: @alunno.cittanascita, cittaresidenza: @alunno.cittaresidenza, cognome: @alunno.cognome, datanascita: @alunno.datanascita, email: @alunno.email, indirizzo: @alunno.indirizzo, nome: @alunno.nome, password: @alunno.password }
    assert_redirected_to alunno_path(assigns(:alunno))
  end

  test "should destroy alunno" do
    assert_difference('Alunno.count', -1) do
      delete :destroy, id: @alunno
    end

    assert_redirected_to alunni_path
  end
end
