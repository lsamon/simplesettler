class Admin::PackagesController < Admin::BaseController
  before_action :find_or_initialize_package, only: [:show, :edit, :update, :destroy]

  def index
    @packages = Package.all
  end

  # def show
  # end

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @package.save
        format.html { redirect_to admin_packages_path, notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to admin_packages_path, notice: 'Package was successfully updated.' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @package.id == Package.first.id
      return redirect_to admin_packages_url, notice: 'Default package cannot be deleted.'
    end

    @package.destroy
    respond_to do |format|
      format.html { redirect_to admin_packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_or_initialize_package
      @package = params[:id] ? Package.where(id: params[:id]).first : Package.new(package_params)
    end

    def package_params
      params.fetch(:package, {}).permit(:name, :price, :description, :status)
    end
end
