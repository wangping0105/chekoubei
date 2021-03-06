namespace :demo do
  desc 'add attachment'
  task attachment: :environment do
    user = User.first
    add_attachment(user)
  end

  desc 'add 2 users'
  task users: :environment do
    store = Store.first
    User.create(phone: "15921076831", role: User.roles[:store_admin], name: 'admin', password: '111111', store_id: store.id)
    User.create(phone: "15921076832", name: 'admin', password: '111111', store_id: store.id)
  end

  desc 'brand '
  task brand: :environment do
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
      Brand.create(name: name)
    end
  end

  desc 'used brand'
  task used_brand: :environment do
    used_brands = %w(奥迪 标致 本田 宝马 奔驰 别克 比亚迪 奔腾 宝骏 北汽 长安 长城 大众 东风 道奇 东风风神 东风小康 东风风行 东风风度 东风风光 丰田 福特 菲亚特 广汽传祺 观致 海马 红旗 哈弗 华颂 吉利 Jeep 江淮 江铃 铃木 猎豹 陆风 MINI 马自达 纳智捷 奇瑞 起亚 启辰 荣威 日产 smart 斯巴鲁 斯柯达 三菱 沃尔沃 五菱 现代 雪佛兰 雪铁龙 众泰)
    Brand.where.not(name: used_brands).delete_all
    p 'delete extra brand'
    used_brands.each{|name| Brand.find_or_create_by(name: name, brand_type: Brand.brand_types[:car])}
    p 'add lost brand'
  end

  desc 'brand other'
  task brand_other: :environment do
    brands = Brand.where(name: ["奥迪", "AC Schnitzer", "Artega", "奔驰", "宝马", "保时捷", "巴博斯", "宝沃", "大众", "KTM", "卡尔森", "MINI", "欧宝", "smart", "STARTECH", "泰卡特", "平安车险", "平安车贷", "平安车抵押"])
    brands.each do |brand|
      store_add(brand)
    end

    name = "太平洋车险"
    b = Brand.find_or_create_by(name: name, brand_type: Brand.brand_types[:car_insurance])
    store_add(b)
    name = "宜车贷"
    b = Brand.find_or_create_by(name: name, brand_type: Brand.brand_types[:car_loan])
    store_add(b)
    name = "太平洋车抵押"
    b = Brand.find_or_create_by(name: name, brand_type: Brand.brand_types[:car_mortgage])
    store_add(b)

    p "over!"
  end

  def store_add(brand)
    case brand.brand_type
       when "car"
        name = ["新车", '二手车'][rand(2)]
       when "car_insurance"
        name = "车险"
       when "car_loan"
        name = "车贷"
       when "car_mortgage"
        name = "车抵押"
    end
    st = StoreCategory.find_by(name: name)
    (1..10).each do |i|
      province = Province.find_by(name: '上海')
      address = Address.create(province: province, detail_address: '宝山区高境一村138号')
      address.convert_detail_address_to_lat_lng
      Store.create(
        name: "#{i}号test#{brand.name}店",
        short_name: "四牌楼#{brand.name}",
        introduction: '专业修车一百年',
        brand_id: brand.id,
        store_type: '',
        store_category_id: st.id,
        business_hours: ["8:00", "18:00"],
        level: 1,
        address: address
      )
    end
    p "over add #{brand.name} store!"
  end

  desc 'add store'
  task store: :environment do
    User.transaction do
      # store = Store.find_by(name: '金陵大众4s店')
      province = Province.find_by(name: '上海')
      deatil_addresses = [
			"宝山区高境一村138号", "虹口区广中五村17号401室", "浦东新区亮秀路112号y1座", "宝山区逸仙路1688号"
      ]
      (1..10).each do |i|
        r_brand = rand(170)
        brand = Brand.all[r_brand]

        address = Address.create(province: province, detail_address: deatil_addresses[rand(deatil_addresses.size)])
        address.convert_detail_address_to_lat_lng

        store = Store.create(
          name: "#{i}号test#{brand.name}4s店",
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
        user = User.find_by(phone: "15921076830")
        add_attachment(store)
      end
    end
  end

  desc 'update_sub_type'
  task update_sub_type: :environment do
    User.transaction do
      Attachment.where(attachmentable_type: "Store").update_all(sub_type: 'image')
    end
  end

  def add_attachment(entity, file_path= "#{Rails.root.to_s}/app/assets/images/demo.jpg")
    if entity
      file = File.new(file_path)
      Attachment.create(
          file: file,
          user_id: entity.id,
          attachmentable: entity,
          note: 'image',
          sub_type: 'image'
      )
      puts "为#{entity.class}创建附件成功！"
    else
      puts "entity 不存在！"
    end
  end
end
