class AddNullFalseToProductFields < ActiveRecord::Migration[7.0]
  def change
    change_column_null :products, :title, false
    change_column_null :products, :desciption, false
    change_column_null :products, :price, false
  end
end
