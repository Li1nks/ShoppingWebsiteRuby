class ProductSearchController < ApplicationController
  def searchProduct
    @get_product = Product.where("")
    puts @get_product
  end
end
