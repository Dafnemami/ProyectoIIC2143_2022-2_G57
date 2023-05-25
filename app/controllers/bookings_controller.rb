require "json"
#require "rest-client"

class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  @@username = "uc_arriagada"
  @@password = "Z1noQlT21e"

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
    @canchas = Cancha.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
    @canchas = Cancha.all
    @users = User.all
    
    @validdatetime = @booking.booked_at.strftime("%Y-%m-%dT%H:%M:%SZ")
    location = "-33.49948202329449,-70.60769579870387"

    @token = get_collection

    @response = HTTParty.get("https://api.meteomatics.com/#{@validdatetime}/t_2m:C,weather_symbol_1h:idx/#{location}/json?access_token=#{@token}")
    @weather_symbol = @response["data"][1]["coordinates"][0]["dates"][0]["value"]
    @temperature = @response["data"][0]["coordinates"][0]["dates"][0]["value"]

    @weather = get_weather(@weather_symbol)

  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    @params = params[:id_court]
    @empty = '⠀⠀'

    @canchas = Cancha.all

    #@cancha_actual = @canchas.find(params[:id_court])
    # @params = params.require(:booking).permit(:id_court)
  end

  # GET /bookings/1/edit
  def edit
    @canchas = Cancha.all
    @users = User.all
    @empty = '⠀⠀'
    @params = @booking.id_court_id
  end


  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_url(@booking), notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

      # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:id_user_id, :id_court_id, :booked_at, :booked_ends, :booked_for, :total_price, :bookingstatus)
    end

    def get_collection
      response = RestClient::Request.new(
        :method => :get,
        :url => "https://login.meteomatics.com/api/v1/token",
        :user => @@username,
        :password => @@password,
        :headers => { :accept => :json, :content_type => :json }
      ).execute
      results = JSON.parse(response.to_str)["access_token"]
    end

    def get_weather(weather_symbol)
      case weather_symbol
      when 1
        return "Clear"
      when 2
        return "Light clouds"
      when 3
        return "Partly cloudy"
      when 4
        return "Cloudy"
      when 5
        return "Rain"
      when 6
        return "Rain and snow / sleet"
      when 7
        return "Snow"
      when 8
        return "Rain shower"
      when 9
        return "Snow shower"
      when 10
        return "Sleet shower"
      when 11
        return "Light Fog"
      when 12
        return "Dense fog"
      when 13
        return "Freezing rain"
      when 14
        return "Thunderstorms"
      when 15
        return "Drizzle"
      when 16
        return "Sandstorm"
      end
    end
end
