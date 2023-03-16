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
    assert_select ".price", "$75"
  end

  test "render a new product form" do
    get new_product_path

    assert_response :success
    assert_select "form"
  end

  test "allow to create a new product" do
    post products_path, params: {
                          product: {
                            title: "Nintendo 64",
                            desciption: "Collectible Item",
                            price: 200,
                          },
                        }
    assert_redirected_to products_path
  end

  test "does not allow to create a new product with empty fields" do
    post products_path, params: {
                          product: {
                            title: "",
                            desciption: "Collectible Item",
                            price: 200,
                          },
                        }
    assert_response :unprocessable_entity
  end
end
