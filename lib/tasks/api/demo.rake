namespace :demo do
  desc 'add attachment'
  task attachment: :environment do
    user = User.first
    add_attachment(user)
  end

  desc 'add store'
  task store: :environment do
    User.transaction do
      brand = Brand.create(name: '大众')
      store = Store.create(
        name: '金陵大众4s店',
        short_name: '金大众',
        introduction: '我擦擦',
        brand_id: brand.id,
        store_type: '',
        business_hours: ["8:00", "18:00"],
        level: 1
      )
      user = User.create(phone: "15921076832", admin: true, name: '测试门店店长', password: '111111')
      add_attachment(user)
    end
  end

  def add_attachment(entity, file_name= 'wp.jpg')
    if entity
      Attachment.create(
        user_id: entity.id,
        attachmentable: entity,
        name: file_name,
        file_name: file_name,
        file_content_type: 'image/jpeg',
        file_size: 1212,
        file_updated_at: Time.now,
        note: 'image',
        sub_type: 'image'
      )
      file_path = "#{Rails.root.to_s}/public/attachments/#{entity.class.name}/#{entity.id}"
      FileUtils.mkpath(file_path)
      FileUtils.cp("/home/wangping/Pictures/#{file_name}", file_path)
      puts "为#{entity.class}创建附件成功！"
    else
      puts "entity 不存在！"
    end
  end
end
