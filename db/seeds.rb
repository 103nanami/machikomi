# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = {email: '123@1234',password: '123456'}
Admin.create_with(admin).find_or_create_by!(email: admin[:email])


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

#City.create!(id: 1, name: '中野')
#City.create!(id: 1, name: '中野')
#City.create!(id: 1, name: '中野')

 citys = [
      {id: 1, name: '中野', column_id: 1},
      {id: 2, name: '高円寺', column_id: 2},
      {id: 3, name: '阿佐ヶ谷', column_id: 3},
      {id: 4, name: '荻窪', column_id: 4},
      {id: 5, name: '西荻窪', column_id: 5},
      {id: 6, name: '吉祥寺', column_id: 6},
      {id: 7, name: '三鷹', column_id: 7}
   ]

   citys.each do |city|
      City.create_with(city).find_or_create_by!(name: city[:name], column_id: city[:column_id])
   end