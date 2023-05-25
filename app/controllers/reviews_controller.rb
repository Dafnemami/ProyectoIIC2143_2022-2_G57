# frozen_string_literal: true

#Controlador de clase Review
class ReviewsController < ApplicationController
    before_action :find_cancha
    before_action :find_review, only: [:edit, :update, :destroy]

    def create
        @review = @cancha.reviews.create(params[:review].permit(:content, :score))
        @review.user_id = current_user.id
        @review.save

        if @review.save
            redirect_to cancha_path(@cancha)
        else
            redirect_to cancha_path(@cancha)
        end
    end

    def destroy
        @review.destroy
        redirect_to cancha_path(@cancha)
    end

    private

    def find_cancha
        @cancha = Cancha.find(params[:cancha_id])
    end

    def find_review
        @review = @cancha.reviews.find(params[:id])
    end
end
