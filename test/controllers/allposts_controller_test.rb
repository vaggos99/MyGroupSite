require 'test_helper'

class AllpostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @allpost = allposts(:one)
  end

  test "should get index" do
    get allposts_url
    assert_response :success
  end

  test "should get new" do
    get new_allpost_url
    assert_response :success
  end

  test "should create allpost" do
    assert_difference('Allpost.count') do
      post allposts_url, params: { allpost: { category: @allpost.category, text: @allpost.text, title: @allpost.title } }
    end

    assert_redirected_to allpost_url(Allpost.last)
  end

  test "should show allpost" do
    get allpost_url(@allpost)
    assert_response :success
  end

  test "should get edit" do
    get edit_allpost_url(@allpost)
    assert_response :success
  end

  test "should update allpost" do
    patch allpost_url(@allpost), params: { allpost: { category: @allpost.category, text: @allpost.text, title: @allpost.title } }
    assert_redirected_to allpost_url(@allpost)
  end

  test "should destroy allpost" do
    assert_difference('Allpost.count', -1) do
      delete allpost_url(@allpost)
    end

    assert_redirected_to allposts_url
  end
end
