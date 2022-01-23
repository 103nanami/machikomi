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
      {id: 1, name: '中野'},
      {id: 2, name: '高円寺'},
      {id: 3, name: '阿佐ヶ谷'},
      {id: 4, name: '荻窪'},
      {id: 5, name: '西荻窪'},
      {id: 6, name: '吉祥寺'},
      {id: 7, name: '三鷹'}
   ]
)