# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
items = [
  { name: "Item 1", description: "The Item 1's description", in_stock: true, sale_price: 100, },
  { name: "Item 2", description: "The Item 2's description", in_stock: true, sale_price: 500, },
  { name: "Item 3", description: "The Item 3's description", in_stock: false, sale_price: 700, },
]

Item.create(items)
