class SimpleAddressSerializer < ActiveModel::Serializer
  include NonullSerializerable

  self.root = false
  attributes :id, :province, :city, :district, :detail_address, :lat, :lng
  #string型属性
  self.stringify_keys = [:tel, :phone, :email, :qq, :fax, :wechat, :wangwang, :zip, :url, :detail_address, :gaode_staticmap, :full_address]

  #integer型属性
  self.integerify_keys = [ :country_id, :province_id, :city_id, :district_id, :off_distance]

  #float型属性
  self.floatify_keys = [:lat, :lng]

  class_attribute :includes_opts
  self.includes_opts = [
                         :country,
                         :province,
                         :city,
                         :district
                       ]
  def lng
     object.lng.to_f
  end

  def lat
     object.lat.to_f
  end

  def country
    object.country.as_json(
      only: [:id, :name, :pinyin]
    ) || {}
  end

  def province
    object.province.as_json(
      only: [:id, :name, :pinyin, :country_id]
    ) || {}
  end

  def city
    object.city.as_json(
      only: [:id, :name, :pinyin, :province_id]
    ) || {}
  end

  def district
    object.district.as_json(
      only: [:id, :name, :pinyin, :city_id]
    ) || {}
  end

  def distance
    if object.respond_to?(:distance) && object.distance
      if object.distance > 1
        "#{object.distance.round(2)}km"
      else
        "#{(object.distance * 1000).round(2)}m"
      end
    else
      "0m"
    end
  end
end
