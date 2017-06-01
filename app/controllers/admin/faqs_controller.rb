class Admin::FaqsController < Admin::BaseController
  before_action :set_Faq, only: [:show, :edit, :update, :destroy]

  def index
    @faqs = Faq.all
  end

  # def show
  # end

  def new
    @faq = Faq.new
  end

  def edit
  end

  def create
    @faq = Faq.new(faq_params)

    respond_to do |format|
      if @faq.save
        format.html { redirect_to admin_faqs_path, notice: 'Faq was successfully created.' }
        format.json { render :show, status: :created, location: @faq }
      else
        format.html { render :new }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @faq.update(faq_params)
        format.html { redirect_to admin_faqs_path, notice: 'Faq was successfully updated.' }
        format.json { render :show, status: :ok, location: @faq }
      else
        format.html { render :edit }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to admin_faqs_url, notice: 'Faq was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_Faq
    @faq = Faq.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def faq_params
    params.require(:faq).permit(:title, :content)
  end
end
