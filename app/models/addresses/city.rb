class City < ActiveRecord::Base
  belongs_to :province
  has_many :districts

  def to_s
    name || id
  end
end
