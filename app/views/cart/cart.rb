class Cart
  def initialize
    @items = []
  end

  def add_product(product)
    @items << product
  end

  def remove_product(product)
    @items.delete(product)
  end

  def items
    @items
  end

  def total_price
    @items.sum(&:price)
  end
end
