class Admin::PackagesController < Admin::BaseController
  before_action :set_package, only: [:show, :edit, :update, :destroy]

  def index
    @packages = Package.all
  end

  # def show
  # end

  def new
    @package = Package.new
  end

  def edit
  end

  def create
    @package = Package.new(package_params)

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
    if @package.id==1
      return redirect_to admin_packages_url, notice: 'Default package cannot be deleted.'
    end

    @package.destroy
    respond_to do |format|
      format.html { redirect_to admin_packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:name, :price, :description, :status)
    end
end
