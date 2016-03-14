class Store < ActiveRecord::Base
  has_many :users
  has_one :address, -> { order('id DESC') }, as: :addressable
  accepts_nested_attributes_for :address, update_only: true, allow_destroy: true
  has_many :attachments, as: :attachmentable
  accepts_nested_attributes_for :attachments, allow_destroy: true

  has_many :image_attachments, -> { where(sub_type: 'image') } , class_name: 'Attachment', as: :attachmentable

  enum store_types: {weixiu: 0, kuaixiu: 1}

  serialize :business_hours

  validates_uniqueness_of :name

  attr_accessor :distance

end
