class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  belongs_to :country
  belongs_to :province
  belongs_to :city
  belongs_to :district

  class << self
    def cities_names
      @_cities_names ||= City.pluck(:name)
    end

    def provinces_names
      @_provinces_names ||= Province.pluck(:name)
    end
  end
end
