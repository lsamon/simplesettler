class Admin::VisaRequirementsController < Admin::BaseController

  before_action :set_visa_type, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    # @visa_types = VisaType.all
  end

  def show
  end

  def new
    @visa_type_requirement = @visa_type.visa_requirements.new
  end

  def edit
    @visa_type_requirement = @visa_type.visa_requirements.find(params[:id])
  end

  def create
    @visa_type_requirement = @visa_type.visa_requirements.new(visa_type_requirements_params)

    respond_to do |format|
      if @visa_type_requirement.save
        puts @visa_type_requirement
        puts "aayo "
        format.html { redirect_to admin_visa_type_path(@visa_type), notice: 'Visa requirement was successfully created.' }
        format.json { render :show, status: :created, location: @visa_type }
      else
        format.html { render :new }
        format.json { render json: @visa_type_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visa_types/1
  # PATCH/PUT /visa_types/1.json
  def update
    respond_to do |format|
      if get_visa_type_requirement.update(visa_type_requirements_params)
        format.html { redirect_to admin_visa_type_path(@visa_type), notice: 'Visa type was successfully updated.' }
        format.json { render :show, status: :ok, location: @visa_type }
      else
        format.html { render :edit }
        format.json { render json: @visa_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    get_visa_type_requirement.destroy
    respond_to do |format|
      # format.html { redirect_to admin_visa_types_path, notice: 'Requirement successfully destroyed.' }
      format.json { head :no_content, notice: 'Requirement successfully destroyed.'  }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_visa_type
    @visa_type = VisaType.find(params[:visa_type_id])
  end

  def get_visa_type_requirement
    VisaType.find(params[:visa_type_id]).visa_requirements.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def visa_type_requirements_params
    params.require(:visa_requirement).permit(:name, :description)
  end

end
