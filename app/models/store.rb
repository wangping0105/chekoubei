class Store < ActiveRecord::Base
  has_many :users
  has_one :address, -> { order('id DESC') }, as: :addressable
  accepts_nested_attributes_for :address, update_only: true, allow_destroy: true
  has_many :attachments, as: :attachmentable
  accepts_nested_attributes_for :attachments, update_only: true, allow_destroy: true

  # has_one :store_category_relation
  belongs_to :store_category#, through: :store_category_relation 一个门店对应一个类型
  has_many :store_cars
  has_many :cars, through: :store_cars
  has_one :store_admin, -> { where(role: User.roles[:store_admin])}, class_name: 'User', foreign_key: :user_id

  has_many :image_attachments, -> { where(sub_type: 'image') } , class_name: 'Attachment', as: :attachmentable

  belongs_to :brand, counter_cache: true

  enum store_types: {weixiu: 0, kuaixiu: 1}

  serialize :business_hours

  validates_uniqueness_of :name
  validates_presence_of :name

  attr_accessor :distance

end
