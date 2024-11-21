class CartController < ApplicationController
  before_action :authenticate_user!

  # Add product to the cart
  def add_to_cart
    product_id = params[:product_id]
    quantity = params[:quantity].to_i

    # Initialize cart if it doesn't exist
    session[:cart] ||= {}

    # Add or update the product in the cart
    if session[:cart][product_id]
      session[:cart][product_id][:quantity] += quantity
    else
      session[:cart][product_id] = { quantity: quantity, price: Product.find(product_id).price }
    end

    # Send back the updated cart total price as JSON
    total_price = calculate_cart_total
    render json: { total_price: total_price }
  end

  # Calculate total price of the cart
  private
  def calculate_cart_total
    total_price = 0
    session[:cart].each do |product_id, details|
      total_price += details[:quantity] * details[:price]
    end
    total_price
  end
end
