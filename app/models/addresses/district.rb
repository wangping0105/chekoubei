class District < ActiveRecord::Base
  belongs_to :city

  def to_s
    name || id
  end
end
