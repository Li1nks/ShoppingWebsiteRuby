namespace :db do
  desc "Seed products from a text file"
  task seed_products: :environment do
    file_path = Rails.root.join("db", "productsList.txt")

    File.open(file_path, "r").each_line do |line|
      product_data = line.strip.split(",")

      Product.create!(
        product_name: product_data[0].strip,
        product_id: product_data[1].strip,
        quantity: product_data[2].strip.to_i,
        manufacturer: product_data[3].strip,
        price: product_data[4].strip.to_f,
        food_types: product_data[5].strip.split(",")
        # Add image path aswell
      )
    end

    puts "Products have been seeded successfully!"
  end
end
