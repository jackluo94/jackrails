# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

include Faker

#Product.destroy_all

50.times do
  product = Product.create(name: Commerce.product_name,
                           description: Hacker.say_something_smart,
                           qty_on_hand: Number.between(1, 100),
                           price: Number.between(1, 100),
                           cost: Number.between(1, 100),
                           shipping_weight: Number.between(1, 20),
                           thumbnail: Placeholdit.image("50x50"),
                           full_size: Placeholdit.image("100x100")
  )
  rand(1..10).times do
    product.reviews.create(name: Name.last_name,
                           comment: Lorem.sentence,
                           rating: Number.between(1, 10))
  end

  #puts product.inspect

end

#Article.destroy_all

50.times do
  article = Article.create(title: Commerce.product_name,
                           author: GameOfThrones.character,
                           published_date: Time.now,
                           published: Number.between(1,2) == 1 ? true : false,
                           content: Lorem.paragraph(3),
                           avatarurl: Placeholdit.image("70x50")
  )
  puts article.inspect
end

50.times do
  blog = Blog.create(title: Commerce.product_name,
                           published_date: Time.now,
                           author: GameOfThrones.character,
                           content: Lorem.paragraph(2)
  )
  rand(1..10).times do
    blog.comments.create(author: Name.last_name,
                           content: Lorem.sentence,
                         rating: Number.between(1,5),
                           avatar_url: Placeholdit.image('80x80')
    )
  end

  #puts product.inspect

end


