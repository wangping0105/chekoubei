class BrandsController < ApplicationController
  before_action :is_super_admin?

  def index
    params[:brand_type] = "car_brand" unless params[:brand_type].in?(%w(car_brand car_insurance_brand car_loan_brand car_mortgage_brand))
    @brand_types = Brand::brand_types.map{|k,v| ["#{I18n.t("enums.brand.brand_type.#{k}")}品牌", "#{k}_brand"]}

    @brands = Brand.send(params[:brand_type]).order(pinyin: :asc)
    @brands = filter_page @brands
  end

  def new
    @brand_types = Brand::brand_types.map{|k,v| ["#{I18n.t("enums.brand.brand_type.#{k}")}品牌", v]}
    @brand = Brand.new
  end

  def create
    _files = params[:file] || []
    Brand.transaction do
      @brand = Brand.new(brand_params.merge(brand_type: brand_params[:brand_type].to_i))

      if @brand.save
        _files.each do |file|
          Attachment.create(file: file, user: current_user, attachmentable: @brand, sub_type: 'image')
        end
        flash[:success] = "创建成功！"

        brand_type = Brand::brand_types.detect{|k,v| v.to_s == brand_params[:brand_type]}.first
        redirect_to brands_path(brand_type: "#{brand_type}_brand")
      else
        flash[:error] = "创建失败！#{@brand.errors.full_messages.join(",")}"
        redirect_to new_brand_path
      end
    end
  end

  private
  def brand_params
    params.require(:brand).permit([:name, :brand_type, attachments_attributes: [:file, :_destroy, :id]])
  end
end