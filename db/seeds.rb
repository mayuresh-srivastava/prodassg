require 'faker'
include Faker

25.times do
  
products = Product.create( name: "#{App.name}", 
                           price: rand(100..200), 
                           description: Lorem.paragraphs.join, 
                           color: rand(32..100), 
                           quantity: rand(11..100), 
                           image: "#{Avatar.image}", 
                           weight: rand(5..50) 
                          )
    products.save!
    if !products.nil?
	    (rand(2..5)).times do
	      products.comments.create!( title: "#{Company.bs}", 
		                               author: "#{Name.name}",
		                               content:Lorem.sentences.join,
		                               rating: rand(1..5)
	                              )
	    end  
    end
end