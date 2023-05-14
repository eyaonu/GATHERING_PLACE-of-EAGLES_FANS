# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'kk@kk', password: '777777')

tags = %w(
    タグ１
    タグ２
    タグ３
    タグ４
)

tags.each do |tag|
    Tag.create!(name: tag)
end

(1..10).each do |n|
    user = User.create!(name: "user#{n}", email: "user#{n}@0", password: "password")
end