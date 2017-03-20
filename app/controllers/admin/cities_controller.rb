class Admin::CitiesController < Admin::BaseController
    before_action :find_or_initialize_city, except: [:index]

    def show
    end

    def index
      @cities = City.page(params[:page]).reorder(sort_order)
    end

    def new
    end

    def create
      @city = City.new(city_params)
      @city.user = @current_user

      if @city.save
        redirect_to root_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @city.update_attributes(city_params)
        redirect_to @city
      else
        render :edit
      end
    end

    def destroy
      @city.destroy
      redirect_to root_path
    end

    private
      # Use callbacks to share common setup or constraints between actions.
    def find_or_initialize_city
      @city = params[:id] ? City.find(params[:id]) : City.new
    end

    def city_params
      params.fetch(:city, {}).permit(:name, :population, :description, :slogan)
    end

    def sort_options
      {'title' => 'name', 'created_at' => 'created_at'}
    end
end
