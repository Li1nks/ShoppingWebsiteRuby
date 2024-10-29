class ProductSearchController < ApplicationController
    def search
      @query = params[:query]
      @products = Product.where("product_name LIKE ? OR manufacturer LIKE ?", "%#{@query}%", "%#{@query}%")
    end
end
