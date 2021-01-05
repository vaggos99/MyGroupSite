require 'test_helper'

class ApostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apost = aposts(:one)
  end

  test "should get index" do
    get aposts_url
    assert_response :success
  end

  test "should get new" do
    get new_apost_url
    assert_response :success
  end

  test "should create apost" do
    assert_difference('Apost.count') do
      post aposts_url, params: { apost: { string: @apost.string, text: @apost.text, title: @apost.title } }
    end

    assert_redirected_to apost_url(Apost.last)
  end

  test "should show apost" do
    get apost_url(@apost)
    assert_response :success
  end

  test "should get edit" do
    get edit_apost_url(@apost)
    assert_response :success
  end

  test "should update apost" do
    patch apost_url(@apost), params: { apost: { string: @apost.string, text: @apost.text, title: @apost.title } }
    assert_redirected_to apost_url(@apost)
  end

  test "should destroy apost" do
    assert_difference('Apost.count', -1) do
      delete apost_url(@apost)
    end

    assert_redirected_to aposts_url
  end
end
