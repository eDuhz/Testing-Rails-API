require 'test_helper'

class ComboboxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @combobox = comboboxes(:one)
  end

  test "should get index" do
    get comboboxes_url, as: :json
    assert_response :success
  end

  test "should create combobox" do
    assert_difference('Combobox.count') do
      post comboboxes_url, params: { combobox: { campaign: @combobox.campaign, cnpj: @combobox.cnpj, contract: @combobox.contract } }, as: :json
    end

    assert_response 201
  end

  test "should show combobox" do
    get combobox_url(@combobox), as: :json
    assert_response :success
  end

  test "should update combobox" do
    patch combobox_url(@combobox), params: { combobox: { campaign: @combobox.campaign, cnpj: @combobox.cnpj, contract: @combobox.contract } }, as: :json
    assert_response 200
  end

  test "should destroy combobox" do
    assert_difference('Combobox.count', -1) do
      delete combobox_url(@combobox), as: :json
    end

    assert_response 204
  end
end
