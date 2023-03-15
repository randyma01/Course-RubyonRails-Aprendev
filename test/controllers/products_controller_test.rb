require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "render a list of product" do
    get products_path

    assert_response :success
    assert_select ".product", 2
  end

  test "render a detailed product page" do
    get product_path(products(:ps4))

    assert_response :success
    assert_select ".title", "PS4 1st-Gen"
    assert_select ".desciption", "Classic Console"
    assert_select ".price", "75"
  end
end
