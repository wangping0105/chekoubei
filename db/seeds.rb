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
    StoreCar.all.delete_all
    Car.all.delete_all
    Brand.all.delete_all
    Attachment.all.delete_all

    %w(新车 二手车 车险 车贷 车抵押).each do |name|
      StoreCategory.create(name: name)
    end
    puts '初始化成功！'

    [
        "奥迪", "AC Schnitzer", "Artega", "奔驰", "宝马", "保时捷", "巴博斯", "宝沃", "大众", "KTM", "卡尔森", "MINI", "欧宝", "smart", "STARTECH", "泰卡特", "威兹曼", "西雅特", "本田", "丰田",
        "光冈", "铃木", "雷克萨斯", "朗世", "马自达", "讴歌", "日产", "三菱", "斯巴鲁", "五十铃", "英菲尼迪", "起亚", "双龙", "现代", "别克", "道奇", "福特", "GMC", "Jeep", "凯迪拉克",
        "克莱斯勒", "林肯", "乔治·巴顿", "山姆", "特斯拉", "雪佛兰", "星客特", "标致", "DS", "雷诺", "PGO", "雪铁龙", "阿斯顿·马丁", "宾利", "捷豹", "路虎", "劳斯莱斯", "路特斯", "迈凯伦", "摩根",
        "Noble", "阿尔法·罗密欧", "布加迪", "法拉利", "菲亚特", "Faralli Mazzanti", "兰博基尼", "玛莎拉蒂", "帕加尼", "依维柯", "科尼赛克", "沃尔沃", "斯柯达", "比亚迪", "宝骏", "北汽幻速", "奔腾",
        "北汽绅宝", "北汽威旺", "北汽制造", "北京", "北汽新能源", "长安轿车", "长城", "长安商用", "昌河", "长安跨越", "长城华冠", "成功", "东风风行", "东南", "东风风神", "东风小康", "东风·郑州日产",
        "东风风度", "东风御风", "福田", "福迪", "福汽启腾", "飞驰商务车", "广汽传祺", "观致汽车", "广汽吉奥", "广汽日野", "哈弗", "海马", "红旗", "华泰", "黄海", "哈飞", "海马商用车", "华颂",
        "恒天汽车", "海格", "汇众", "江淮", "吉利汽车", "江铃", "金杯", "九龙", "江南", "江铃集团轻汽", "金旅客车", "开瑞", "凯翼", "卡威", "科瑞斯的", "康迪", "陆风", "猎豹汽车", "力帆", "莲花",
        "蓝海房车", "理念", "雷丁电动", "MG", "美亚", "纳智捷", "欧朗", "欧联", "奇瑞", "启辰", "庆铃", "荣威", "上汽大通MAXUS", "上喆汽车", "陕汽通家", "腾势", "五菱", "潍柴英致", "威麟", "潍柴欧睿",
        "厦门金龙", "新凯", "一汽", "野马汽车", "永源", "游侠汽车", "宇通", "御捷", "扬州亚星客车", "众泰", "中华", "中兴", "知豆", "中欧奔驰房车", "之诺", "浙江卡尔森", "中通客车", "重汽王牌"
    ].each do |name|
      Brand.create(name: name, brand_type: Brand.brand_types[:car])
    end
    brand = Brand.first
    puts '初始化车品牌成功！'

    province = Province.find_by(name: '上海')
    address = Address.create(province: province, detail_address: '宝山区高境一村138号')
    address.convert_detail_address_to_lat_lng

    st = StoreCategory.first
    store = Store.create(
        name: "1号test#{brand.name}4s店",
        short_name: "四牌楼#{brand.name}",
        introduction: '专业修车一百年',
        brand_id: brand.id,
        store_type: '',
        business_hours: ["8:00", "18:00"],
        level: 1,
        address: address
    )
    st.store_category_relations.create(store: store)

    user = User.create(phone: "15921076830", role: User.roles[:super_admin], name: '平神', password: '111111', store_id: store.id, identify_status: 1)
    user1 = User.create(phone: "18014821644", role: User.roles[:super_admin], name: '张先生', password: '111111', store_id: store.id, identify_status: 1)
    user2 = User.create(phone: "13041487469", role: User.roles[:super_admin], name: 'asan', password: '111111', store_id: store.id)
    add_attachment(user)
    add_attachment(user1)

    attr = {
        user: user2,
        true_name: "鲁大伟",
        extra: {
            job: "程序猿",
            invite_phones: ["15921076830", "18014821644"]
        }
    }
    AuthApply.create(attr)

    car = Car.create(brand_id: Brand.first.id, user_id: User.first.id, model_no: 'test型号', color: '绿色', distance: 150000, on_time: "2015-11-11", description:'11111', car_type: 0)
    add_attachment(car, "#{Rails.root.to_s}/app/assets/images/demo_car.png")
    store.store_cars.create(car_id: car.id)

    puts '初始化成功！'
  end
end
