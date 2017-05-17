class Admin::VisaTypesController < Admin::BaseController
  before_action :set_visa_type, only: [:show, :edit, :update, :destroy]

  # GET /visa_types
  # GET /visa_types.json
  def index
    @visa_types = VisaType.all
  end

  # GET /visa_types/1
  # GET /visa_types/1.json
  def show
  end

  # GET /visa_types/new
  def new
    @visa_type = VisaType.new
  end

  # GET /visa_types/1/edit
  def edit
  end

  # POST /visa_types
  # POST /visa_types.json
  def create
    @visa_type = VisaType.new(visa_type_params)

    respond_to do |format|
      if @visa_type.save
        format.html { redirect_to @visa_type, notice: 'Visa type was successfully created.' }
        format.json { render :show, status: :created, location: @visa_type }
      else
        format.html { render :new }
        format.json { render json: @visa_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visa_types/1
  # PATCH/PUT /visa_types/1.json
  def update
    respond_to do |format|
      if @visa_type.update(visa_type_params)
        format.html { redirect_to admin_visa_types_path, notice: 'Visa type was successfully updated.' }
        format.json { render :show, status: :ok, location: @visa_type }
      else
        format.html { render :edit }
        format.json { render json: @visa_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visa_types/1
  # DELETE /visa_types/1.json
  def destroy
    @visa_type.destroy
    respond_to do |format|
      format.html { redirect_to visa_types_url, notice: 'Visa type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visa_type
      @visa_type = VisaType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visa_type_params
      params.require(:visa_type).permit(:name, :description)
    end
end
