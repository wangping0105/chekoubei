# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.transaction do
  if User.count < 5
    StoreCategory.all.delete_all
    Address.all.delete_all
    User.all.delete_all
    Store.all.delete_all

    %w(新车 二手车 车险 车贷 车抵押).each do |name|
      StoreCategory.create(name: name)
    end


    brand = Brand.create(name: '奥迪')
    province = Province.find_by(name: '上海')
    address = Address.create(province: province, detail_address: '宝山区高境一村138号')
    address.convert_detail_address_to_lat_lng

    st = StoreCategory.first
    store = Store.create(
        name: "1号test#{brand.name}4s店",
        short_name: '金大众',
        introduction: '我擦擦',
        brand_id: brand.id,
        store_type: '',
        business_hours: ["8:00", "18:00"],
        level: 1,
        address: address,
        lat: address.lat,
        lng: address.lng
    )
    st.store_category_relations.create(store: store)
    u = User.create(phone: "15921076830", admin: true, name: 'admin', password: 'chekoubei', store_id: store.id)
    Car.create(brand_id: Brand.first.id, user_id: User.first.id, model_no: 'test型号', color: '绿色', distance: 150000, on_time: Date.new("2015-11-11"), description:'11111', car_type: 0)

    puts '初始化成功！'
  end

end
