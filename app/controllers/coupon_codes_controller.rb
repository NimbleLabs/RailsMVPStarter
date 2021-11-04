class CouponCodesController < ApplicationController
  require 'csv'
  before_action :set_coupon_code, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :ensure_admin

  # GET /coupon_codes
  # GET /coupon_codes.json
  def index
    @coupon_codes = CouponCode.all

    respond_to do |format|
      format.html
      format.csv do
        send_data CouponCode.to_csv, filename: "Coupons-#{Date.current.strftime('%D')}.csv"
      end
    end

  end

  # GET /coupon_codes/1
  # GET /coupon_codes/1.json
  def show
  end

  # GET /coupon_codes/new
  def new
    @coupon_code = CouponCode.new
  end

  # GET /coupon_codes/1/edit
  def edit
  end

  # POST /coupon_codes
  # POST /coupon_codes.json
  def create
    @coupon_code = CouponCode.new(coupon_code_params)

    respond_to do |format|
      if @coupon_code.save
        format.html { redirect_to @coupon_code, notice: 'Coupon code was successfully created.' }
        format.json { render :show, status: :created, location: @coupon_code }
      else
        format.html { render :new }
        format.json { render json: @coupon_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupon_codes/1
  # PATCH/PUT /coupon_codes/1.json
  def update
    respond_to do |format|
      if @coupon_code.update(coupon_code_params)
        format.html { redirect_to @coupon_code, notice: 'Coupon code was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon_code }
      else
        format.html { render :edit }
        format.json { render json: @coupon_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupon_codes/1
  # DELETE /coupon_codes/1.json
  def destroy
    @coupon_code.destroy
    respond_to do |format|
      format.html { redirect_to coupon_codes_url, notice: 'Coupon code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon_code
      @coupon_code = CouponCode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coupon_code_params
      params.require(:coupon_code).permit(:code, :offer, :user_id)
    end
end
