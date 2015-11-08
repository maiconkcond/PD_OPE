require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: { bairro: @client.bairro, cel1: @client.cel1, cel2: @client.cel2, cep: @client.cep, cidade: @client.cidade, complemento: @client.complemento, email: @client.email, endereco: @client.endereco, nome: @client.nome, obs: @client.obs, tel1: @client.tel1, tel2: @client.tel2 }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client
    assert_response :success
  end

  test "should update client" do
    patch :update, id: @client, client: { bairro: @client.bairro, cel1: @client.cel1, cel2: @client.cel2, cep: @client.cep, cidade: @client.cidade, complemento: @client.complemento, email: @client.email, endereco: @client.endereco, nome: @client.nome, obs: @client.obs, tel1: @client.tel1, tel2: @client.tel2 }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end
