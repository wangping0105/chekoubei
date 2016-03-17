# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(phone: "15921076830", admin: true, name: 'admin', password: 'chekoubei')

%w(新车 二手车 车险 车贷 车抵押).each do |name|
  StoreCategory.create(name: name)
end

puts '初始化成功！'
