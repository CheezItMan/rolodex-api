# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def pic
  num = rand(1..3)
  case num
  when 1
    return 'http://www.placecage.com/c/128/128'
  when 2
    return 'http://www.fillmurray.com/128/128'
  when 3
    return 'http://placekitten.com/128/128'
  end
end

10.times do
  contact = Contact.new({name: Faker::GameOfThrones.character, tel: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email, avatar: pic })

  contact.save
end
