
require 'open-uri'
require 'nokogiri'

Product.delete_all
Event.destroy_all
# User.destroy_all
Category.destroy_all

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
  url_title = title.downcase.gsub(" ", "")
  url = "https://bosqueplants.com/en/plants/#{url_title}"
  # p url_title
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  five_tr = html_doc.search("tr:nth-child(5)")
  six_tr = html_doc.search("tr:nth-child(6)")
  description = five_tr.search("td:nth-child(2)").text
  description_watering = six_tr.search("td:nth-child(2)").text
  # p description.text
  # p description_watering.text
  desc =  "#{box.search('p').text} #{description} #{description_watering}"
  price =  box.search('.price').text.strip
  img = box.search('img').attribute('src').value
  Product.create!(title: title, description: desc, price: price, image: img, category: Category.all.sample)
  puts "Created product #{index + 1}"
end
puts "Congrats you now have #{Product.count} products."
puts "Finish creating products"



puts 'creating user'
laura = User.create(email: 'laura@gmail.com', password: '123456')

puts 'creating events'

cleaning = Event.create!(title: "Cleaning Treptower Park", description: "There is so much trash", address: "Treptower Park", neighbourhood: "Treptower", category: "Sustainability", start_time: "7PM")
feeding = Event.create!(title: "Feeding the homeless at Alex", description: "Soups for everyone", address: "Alexanderplatz", neighbourhood: "Mitte", category: "Charity", start_time: "7PM")


