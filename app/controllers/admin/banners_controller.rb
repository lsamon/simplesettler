class Admin::BannersController < Admin::BaseController
    before_action :find_or_initialize_banner, except: [:index]

    def show
    end

    def index
      @banners = Banner.page(params[:page]).per(20).reorder(sort_order)
      respond_to do |format|
        format.html
        format.js { render :file => "/shared/admin.js.erb" }
      end
    end

    def new
    end

    def create
      @banner = Banner.new(banner_params)
      if @banner.save
        redirect_to admin_banners_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @banner.update_attributes(banner_params)
        redirect_to admin_banners_path
      else
        render :edit
      end
    end

    def destroy
      @banner.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
    def find_or_initialize_banner
      @banner = params[:id] ? Banner.find(params[:id]) : Banner.new
    end

    def banner_params
      params.fetch(:banner, {}).permit(:title, :media, :slug)
    end

    def sort_options
      {'title' => 'title'}
    end
end
