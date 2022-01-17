# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: '123@1234',
   password: '123456'
)

City.create!(
   [
      {name: '中野'},
      {name: '高円寺'},
      {name: '阿佐ヶ谷'},
      {name: '荻窪'},
      {name: '西荻窪'},
      {name: '吉祥寺'},
      {name: '三鷹'}
   ]
)