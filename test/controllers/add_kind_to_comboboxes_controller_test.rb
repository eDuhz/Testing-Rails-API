require 'test_helper'

class AddKindToComboboxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @add_kind_to_combobox = add_kind_to_comboboxes(:one)
  end

  test "should get index" do
    get add_kind_to_comboboxes_url, as: :json
    assert_response :success
  end

  test "should create add_kind_to_combobox" do
    assert_difference('AddKindToCombobox.count') do
      post add_kind_to_comboboxes_url, params: { add_kind_to_combobox: { kind_id: @add_kind_to_combobox.kind_id } }, as: :json
    end

    assert_response 201
  end

  test "should show add_kind_to_combobox" do
    get add_kind_to_combobox_url(@add_kind_to_combobox), as: :json
    assert_response :success
  end

  test "should update add_kind_to_combobox" do
    patch add_kind_to_combobox_url(@add_kind_to_combobox), params: { add_kind_to_combobox: { kind_id: @add_kind_to_combobox.kind_id } }, as: :json
    assert_response 200
  end

  test "should destroy add_kind_to_combobox" do
    assert_difference('AddKindToCombobox.count', -1) do
      delete add_kind_to_combobox_url(@add_kind_to_combobox), as: :json
    end

    assert_response 204
  end
end
