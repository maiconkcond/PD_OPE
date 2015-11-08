require 'test_helper'

class GrupoEstoquesControllerTest < ActionController::TestCase
  setup do
    @grupo_estoque = grupo_estoques(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grupo_estoques)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grupo_estoque" do
    assert_difference('GrupoEstoque.count') do
      post :create, grupo_estoque: { descricao_loga: @grupo_estoque.descricao_loga, nome: @grupo_estoque.nome }
    end

    assert_redirected_to grupo_estoque_path(assigns(:grupo_estoque))
  end

  test "should show grupo_estoque" do
    get :show, id: @grupo_estoque
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grupo_estoque
    assert_response :success
  end

  test "should update grupo_estoque" do
    patch :update, id: @grupo_estoque, grupo_estoque: { descricao_loga: @grupo_estoque.descricao_loga, nome: @grupo_estoque.nome }
    assert_redirected_to grupo_estoque_path(assigns(:grupo_estoque))
  end

  test "should destroy grupo_estoque" do
    assert_difference('GrupoEstoque.count', -1) do
      delete :destroy, id: @grupo_estoque
    end

    assert_redirected_to grupo_estoques_path
  end
end
