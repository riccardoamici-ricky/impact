
require 'open-uri'
require 'nokogiri'


Event.destroy_all
User.destroy_all
Category.destroy_all
Product.delete_all

puts 'Creating categories'
Category.create(name: 'Fashion')
Category.create(name: 'Plants')
Category.create(name: 'Food')
Category.create(name: 'Interior')
puts 'Habemus categories'

url = "https://bosqueplants.com/en/plants"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
html_doc.search(".product").each_with_index do |box, index|
  title =  box.search('h5').text
  desc =  box.search('p').text
  price =  box.search('.price').text.strip
  img = box.search('img').attribute('src').value
  Product.create(title: title, description: desc, price: price, image: img)
  puts "Created product #{index + 1}"
end
  puts "Finish creating products"

puts 'creating user'

laura = User.create(email: 'laura@gmail.com', password: '123456')

puts 'creating events'

cleaning = Event.create!(title: "Cleaning Treptower Park", description: "There is so much trash", address: "Treptower Park", neighbourhood: "Treptower", category: "Sustainability", start_time: "7PM")
feeding = Event.create!(title: "Feeding the homeless at Alex", description: "Soups for everyone", address: "Alexanderplatz", neighbourhood: "Mitte", category: "Charity", start_time: "7PM")


