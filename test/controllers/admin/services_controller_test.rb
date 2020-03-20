require 'test_helper'

class Admin::ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_service = admin_services(:one)
  end

  test "should get index" do
    get admin_services_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_service_url
    assert_response :success
  end

  test "should create admin_service" do
    assert_difference('Admin::Service.count') do
      post admin_services_url, params: { admin_service: {  } }
    end

    assert_redirected_to admin_service_url(Admin::Service.last)
  end

  test "should show admin_service" do
    get admin_service_url(@admin_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_service_url(@admin_service)
    assert_response :success
  end

  test "should update admin_service" do
    patch admin_service_url(@admin_service), params: { admin_service: {  } }
    assert_redirected_to admin_service_url(@admin_service)
  end

  test "should destroy admin_service" do
    assert_difference('Admin::Service.count', -1) do
      delete admin_service_url(@admin_service)
    end

    assert_redirected_to admin_services_url
  end
end
