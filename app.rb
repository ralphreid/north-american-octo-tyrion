require 'pry'


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

# Build rules
rules = []
rules.push Rule.new(nil, nil, 60, 10, nil)
rules.push Rule.new(1, 2, nil, nil, 8.50)

# Instantiate checkout object
co = Checkout.new(rules)

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
  when "1" then
    puts "ITEM ID\t\tPRODUCT NAME\t\t\tDISCOUNT QUANTITY\t\tTOTAL SPEND\t\tDISCOUNT PRICE\t\tDISCOUNT PERCENTAGE\n\n"
    rules.each do |r|
      item_id = r.item_id
      if item_id != nil
        product_name = products[item_id].name
        discount_price = r.discount_price
        discounted_quantity = r.discounted_quantity
        total_spend = 'n/a'
        discount_percentage = 'n/a'
      else
        product_name = "n/a"
        item_id = 'n/a'
        discount_price = 'n/a'
        discounted_quantity = 'n/a'
        total_spend = r.total_spend
        discount_percentage = r.discount_percentage
      end

      puts "#{item_id}\t\t#{product_name}\t\t\t\t#{discounted_quantity}\t\t\t#{total_spend}\t\t\t#{discount_price}\t\t\t#{discount_percentage}\n"
    end
  when "2" then
    puts "ITEM ID\t\tPRODUCT NAME\t\t\tPRICE"
    seed_products.each do |p|
      puts "#{p[0]}\t\t#{p[1]}\t\t\t#{p[2]}"
    end
  when "3" then
    purchase = ""
    puts "Which Product would you like to buy? (enter item id)"
    purchase = gets.chomp.strip.to_i
    co.scan(products[purchase])
  when "4" then
    # co.scan(products[1])
    # co.scan(products[1])
    # co.scan(products[1])
    # co.scan(products[2])
    puts "ITEM ID\t\tPRODUCT NAME\n"
    basket = co.getBasket
    basket.each do |b|
      puts "#{b.id}\t\t#{b.name}"
    end

  when "5" then
    puts "Your total cost is #{co.total}\n\n"
    puts "Your discounted cost is #{co.discounted_total}\n"
  when "6" then puts "cool"
  when "q" then exit
  end
end
