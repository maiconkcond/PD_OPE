require 'test_helper'

class FornecedorsControllerTest < ActionController::TestCase
  setup do
    @fornecedor = fornecedors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fornecedors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fornecedor" do
    assert_difference('Fornecedor.count') do
      post :create, fornecedor: { bairro: @fornecedor.bairro, cep: @fornecedor.cep, cep: @fornecedor.cep, cidade: @fornecedor.cidade, endereco: @fornecedor.endereco, nome_fantasia: @fornecedor.nome_fantasia, razao_social: @fornecedor.razao_social, tel1: @fornecedor.tel1, tel2: @fornecedor.tel2 }
    end

    assert_redirected_to fornecedor_path(assigns(:fornecedor))
  end

  test "should show fornecedor" do
    get :show, id: @fornecedor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fornecedor
    assert_response :success
  end

  test "should update fornecedor" do
    patch :update, id: @fornecedor, fornecedor: { bairro: @fornecedor.bairro, cep: @fornecedor.cep, cep: @fornecedor.cep, cidade: @fornecedor.cidade, endereco: @fornecedor.endereco, nome_fantasia: @fornecedor.nome_fantasia, razao_social: @fornecedor.razao_social, tel1: @fornecedor.tel1, tel2: @fornecedor.tel2 }
    assert_redirected_to fornecedor_path(assigns(:fornecedor))
  end

  test "should destroy fornecedor" do
    assert_difference('Fornecedor.count', -1) do
      delete :destroy, id: @fornecedor
    end

    assert_redirected_to fornecedors_path
  end
end
