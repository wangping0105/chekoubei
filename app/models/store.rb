class Store < ActiveRecord::Base
  has_many :users
  has_one :address, -> { order('id DESC') }, as: :addressable
  accepts_nested_attributes_for :address, update_only: true, allow_destroy: true
  has_many :attachments, as: :attachmentable
  accepts_nested_attributes_for :attachments, update_only: true, allow_destroy: true

  has_one :store_category_relation
  has_one :store_category, through: :store_category_relation
  has_many :store_cars
  has_many :cars, through: :store_cars

  accepts_nested_attributes_for :attachments, allow_destroy: true

  has_many :image_attachments, -> { where(sub_type: 'image') } , class_name: 'Attachment', as: :attachmentable

  belongs_to :brand, counter_cache: true

  enum store_types: {weixiu: 0, kuaixiu: 1}

  serialize :business_hours

  validates_uniqueness_of :name

  attr_accessor :distance

end
