categories = %w(tv mobile tablet ac refridgerator)

(1..5).each do |i|
  category = Category.create(name: categories[i - 1])

  total = rand(100..200)
  products = []
  (1..total).each do |i|
    name = (0...8).map { (65 + rand(26)).chr }.join + i.to_s
    price = rand(500.0...1000.0).round(2)

    products << {name: name, price: price, category_id: category.id, created_at: Time.now, updated_at: Time.now}
  end

  Product.upsert_all(products)
end


users = [
  {
    name: 'Bachan',
    email: 'bachan37@gmail.com'
  },
  {
    name: 'rishabh',
    email: 'rishabh@gmail.com'
  },
  {
    name: 'unmesh',
    email: 'unmesh@gmail.com'
  },
  {
    name: 'suman',
    email: 'suman@gmail.com'
  }
]

data = []

users.each do |user_data|
  data << user_data.merge!(password: 'mindfire', created_at: Time.now, updated_at: Time.now)
end

User.upsert_all(data)