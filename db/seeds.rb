
require 'open-uri'
require 'nokogiri'


Event.destroy_all
Post.destroy_all
User.destroy_all
Product.delete_all
Category.destroy_all
Comment.destroy_all


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
  desc =  "#{box.search('p').text}. #{description} #{description_watering}"
  price =  box.search('.price').text.strip
  img = box.search('img').attribute('src').value
  Product.create!(title: title, description: desc, price: price, url: url, image: img, category: Category.find_by(name:'Plants'))
  puts "Created product #{index + 1}"

  end
  puts "Congrats you now have #{Product.count} products."
  puts "Finish creating products"


puts 'creating users'
laura = User.create(email: 'laura@impact.com', password: '123456', username: 'footer20')

puts 'creating events'
file4 = URI.open('https://res.cloudinary.com/dsij1zq1l/image/upload/v1606896079/Impact%20events/pexels-suzy-hazelwood-1855203_fl6qdp.jpg')

upcycle = Event.create!(title: "Pimp up your old clothes", description: "What if we told you that your old clothes can become amazing again? Join us in our workshop for upciclying, we provide sewing material!", address: "Leopoldplatz, Berlin", neighbourhood: "Berlin, Wedding", category: "Sustainability", start_time: "10 Dec 4:00 pm", user_id: laura[:id])
upcycle.photo.attach(io: file4, filename: 'sewing.jpg', content_type: 'image/jpg')
file3 = URI.open('https://res.cloudinary.com/dsij1zq1l/image/upload/v1606407961/Impact%20events/pexels-anete-lusina-5723321_gx24b6.jpg')
feeding = Event.create!(title: "Warm soups for those in need!", description: "It's not only for Christmas that we need to care for the people in need. Please bring some food and warm clothes, the event will take place outside!", address: "Alexanderplatz, Berlin", neighbourhood: "Berlin, Mitte", category: "Charity", start_time: "04 Dec 2:00 pm", user_id: laura[:id])
feeding.photo.attach(io: file3, filename: 'feed.jpg', content_type: 'image/jpg')
file2 = URI.open('https://res.cloudinary.com/dsij1zq1l/image/upload/v1606407609/Impact%20events/pexels-cottonbro-4684377_zj8t3e.jpg')
cleaning = Event.create!(title: "Let's clean Hasenheide!", description: "It is now time to give back to our beloved park, let's go and collect trash and bottle caps! Bring comfy shoes!", address: "Hasenheide, Berlin", neighbourhood: "Berlin, Neukölln", category: "Environment", start_time: "22 Dec 8:00 pm", user_id: laura[:id])
cleaning.photo.attach(io: file2, filename: 'clean.jpg', content_type: 'image/jpg')
file1 = URI.open('https://res.cloudinary.com/dsij1zq1l/image/upload/v1606407038/Impact%20events/pexels-eric-yeich-5879668_mqxdxg.jpg')
protest = Event.create!(title: "Free Melania", description: "Melania Trump, is she really Donald Trump’s prisoner? Or is she normal simple woman?", address: "Hermannplatz, Berlin", neighbourhood: "Berlin, Neukölln", category: "Protest", start_time: "9 Jan 5:00 pm", user_id: laura[:id])

protest.photo.attach(io: file1, filename: 'melania.jpg', content_type: 'image/jpg')
