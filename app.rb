# require 'pry'


Dir[__dir__ + '/lib/*.rb'].each {|file| require file }

# Build Product List
products = Hash.new
seed_products = []
seed_products.push([1,'Travel Card Holder', 9.25, :GBP])
seed_products.push([2,'Personalised cufflinks', 45.0, :GBP])
seed_products.push([3,'Kids T-shirt', 19.95, :GBP])
seed_products.each do |seed_product|
  p = Product.new(*seed_product)
  products.store(seed_product[0], p)
end

# show menu
user_input = ""

while user_input != "q"
  puts "\nWelcome to the Checkout System!\n\nWhat would you like to do?\n\n"
  puts "1. List current discount rules"
  puts "2. List products availible"
  puts "3. Scan a product"
  puts "4. List items in your basket"
  puts "5. Checkout"
  puts "6. Admin - Add a new rule"
  puts "Press q to quit"
  user_input = gets.chomp.strip
  puts ""

  case user_input
  when "1" then puts "cool"
  when "2" then puts "cool"
  when "3" then puts "cool"
  when "4" then puts "cool"
  when "5" then puts "cool"
  when "6" then puts "cool"
  when "q" then exit
  end
end




# Build rules
rules = []
rules.push Rule.new(nil, nil, 60, 10, nil)
rules.push Rule.new(1, 2, nil, nil, 8.50)




co = Checkout.new(rules)
co.scan(products[1])
co.scan(products[1])
co.scan(products[1])
co.scan(products[2])

puts "This is the total cost #{co.total}"
puts "This is the discounted cost #{co.discounted_total}"



# binding.pry
