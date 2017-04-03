class Admin::CategoriesController < Admin::BaseController
    before_action :find_or_initialize_category, except: [:index]

    def show
    end

    def index
      @categories = Category.page(params[:page]).reorder(sort_order)
    end

    def new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_categories_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @category.update_attributes(category_params)
        redirect_to admin_categories_path
      else
        render :edit
      end
    end

    def destroy
      @category.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
    def find_or_initialize_category
      @category = params[:id] ? Category.find(params[:id]) : Category.new
    end

    def category_params
      params.fetch(:category, {}).permit(:name, :image)
    end

    def cities
      params[:category][:city_ids].select{|n| n.present?}.map do | city_id |
        City.find(city_id.to_i)
      end
    end

    def sort_options
      {'name' => 'name', 'created_at' => 'created_at'}
    end
end
