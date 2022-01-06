# frozen_string_literal: true

class InstructorCartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy]
  # GET /carts or /carts.json
  def index
    @carts = InstructorCart.all
  end

  # GET /carts/1 or /carts/1.json
  def show; end

  # GET /carts/new
  def new
    @cart = InstructorCart.new
  end

  # GET /carts/1/edit
  def edit; end

  # POST /carts or /carts.json
  def create
    @cart = InstructorCart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to instructor_carts_path, notice: 'Course was successfully added to cart.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { redirect_to courses_path, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Course was successfully removed from cart.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to instructor_carts_path, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = InstructorCart.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cart_params
    params.require(:instructorcart).permit(:instructor_id, :course_id)
  end
end
