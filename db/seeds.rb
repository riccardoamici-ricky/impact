require 'open-uri'
require 'nokogiri'

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
