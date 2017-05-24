class Admin::PaymentsController < Admin::BaseController
  before_action :set_admin_payment, only: [:show, :edit, :update, :destroy]

  # GET /admin/payments
  # GET /admin/payments.json
  def index
    @payments = Payment.all
  end

  # GET /admin/payments/1
  # GET /admin/payments/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_payment_params
      params.fetch(:admin_payment, {})
    end
end
