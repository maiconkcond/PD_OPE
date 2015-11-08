require 'test_helper'

class UnidMedsControllerTest < ActionController::TestCase
  setup do
    @unid_med = unid_meds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unid_meds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unid_med" do
    assert_difference('UnidMed.count') do
      post :create, unid_med: { abreviacao: @unid_med.abreviacao, descricao: @unid_med.descricao }
    end

    assert_redirected_to unid_med_path(assigns(:unid_med))
  end

  test "should show unid_med" do
    get :show, id: @unid_med
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unid_med
    assert_response :success
  end

  test "should update unid_med" do
    patch :update, id: @unid_med, unid_med: { abreviacao: @unid_med.abreviacao, descricao: @unid_med.descricao }
    assert_redirected_to unid_med_path(assigns(:unid_med))
  end

  test "should destroy unid_med" do
    assert_difference('UnidMed.count', -1) do
      delete :destroy, id: @unid_med
    end

    assert_redirected_to unid_meds_path
  end
end
