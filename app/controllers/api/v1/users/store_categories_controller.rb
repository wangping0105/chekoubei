class Api::V1::Users::StoreCategoriesController < ApplicationController
  def index
    @store_categories = StoreCategory.limit(5)

    render json: {
      code: 0,
      data: @store_categories.map{|s|
        {id: s.id, name: s.name}
      }
    }
  end
end
