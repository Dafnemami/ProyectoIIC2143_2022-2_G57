# frozen_string_literal: true

# Controlador de la clase Usuarios
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  # # GET /resource/edit
  # def edit
  #   puts "edit"
  #   super
  # end

  # # PUT /resource
  # def update
  #   puts "update"
  #   super
  # end

  # GET /canchas/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PATCH/PUT /canchas/1 or /canchas/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        redirect_to users_index_path, notice: 'User was successfully updated.'
        format.json { render :show, status: :ok, location: @cancha }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canchas/1 or /canchas/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |_format|
      redirect_to users_index_path, notice: 'User deleted.'
    end
  end
end
