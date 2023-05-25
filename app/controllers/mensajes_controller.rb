class MensajesController < ApplicationController
  def index
    @mensajes_recibidos = Mensaje.where(receptor: current_user.name).order(created_at: :desc)
    @mensajes_enviados = Mensaje.where(emisor: current_user.id).order(created_at: :desc)
    # @mensajes = Mensaje.all
  end

  def new
    @mensaje = Mensaje.new
    @users = User.all

  end

  def create
    @mensaje_params = params.permit(:authenticity_token, mensaje: [:emisor, :receptor, :cuerpo])

    if User.find_by(name: @mensaje_params[:mensaje][:receptor]).nil?
      redirect_to mensajes_index_path, notice: "Error sending the message, #{@mensaje_params[:mensaje][:receptor]} user does not exist"
    else
      @np = {emisor: current_user.id, receptor: @mensaje_params[:mensaje][:receptor], cuerpo: @mensaje_params[:mensaje][:cuerpo]}
      @mensaje = Mensaje.create(@np)
      @mensaje.save

      if @mensaje.save
        redirect_to mensajes_index_path, notice: 'Message sent'
      else
        redirect_to mensajes_index_path, notice: 'Error sending the message'
      end
    end
  end
end
