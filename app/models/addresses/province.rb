class Province < ActiveRecord::Base
  belongs_to :country

  has_many :cities

  def to_s
    name || id
  end
end
