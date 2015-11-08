require 'test_helper'

class ItensPedidosControllerTest < ActionController::TestCase
  setup do
    @itens_pedido = itens_pedidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itens_pedidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itens_pedido" do
    assert_difference('ItensPedido.count') do
      post :create, itens_pedido: { estoque_id: @itens_pedido.estoque_id, pedido_id: @itens_pedido.pedido_id }
    end

    assert_redirected_to itens_pedido_path(assigns(:itens_pedido))
  end

  test "should show itens_pedido" do
    get :show, id: @itens_pedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itens_pedido
    assert_response :success
  end

  test "should update itens_pedido" do
    patch :update, id: @itens_pedido, itens_pedido: { estoque_id: @itens_pedido.estoque_id, pedido_id: @itens_pedido.pedido_id }
    assert_redirected_to itens_pedido_path(assigns(:itens_pedido))
  end

  test "should destroy itens_pedido" do
    assert_difference('ItensPedido.count', -1) do
      delete :destroy, id: @itens_pedido
    end

    assert_redirected_to itens_pedidos_path
  end
end
