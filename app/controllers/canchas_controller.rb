# frozen_string_literal: true

# Controlador de la clase Canchas
class CanchasController < ApplicationController
  before_action :set_cancha, only: %i[show edit update destroy]

  # GET /canchas or /canchas.json
  def index
    @canchas = Cancha.all
    # Search for canchas by name
    @canchas = @canchas.where('nombre LIKE ?', "%#{params[:search]}%") if params[:search].present?
    # Order by order_by param and descendent
    @canchas = @canchas.order("#{params[:order_by]} ASC") if params[:order_by].present?
  end

  # GET /canchas/1 or /canchas/1.json
  def show
    @total_reviews = Review.where(cancha_id: @cancha).count
    @reviews = Review.where(cancha_id: @cancha).order('created_at DESC').max(5)
    @mean_score = Review.where(cancha_id: @cancha).average(:score)
  end

  # GET /canchas/new
  def new
    @cancha = Cancha.new
  end

  # GET /canchas/1/edit
  def edit; end

  # POST /canchas or /canchas.json
  def create
    @cancha = Cancha.new(cancha_params)

    respond_to do |format|
      if @cancha.save
        format.html { redirect_to cancha_url(@cancha), notice: 'Cancha was successfully created.' }
        format.json { render :show, status: :created, location: @cancha }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cancha.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /canchas/1 or /canchas/1.json
  def update
    respond_to do |format|
      if @cancha.update(cancha_params)
        format.html { redirect_to cancha_url(@cancha), notice: 'Cancha was successfully updated.' }
        format.json { render :show, status: :ok, location: @cancha }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cancha.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canchas/1 or /canchas/1.json
  def destroy
    @cancha.destroy

    respond_to do |format|
      format.html { redirect_to canchas_url, notice: 'Cancha was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cancha
    @cancha = Cancha.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cancha_params
    params.require(:cancha).permit(:nombre, :deporte, :estado, :image_url, :price)
  end
end
