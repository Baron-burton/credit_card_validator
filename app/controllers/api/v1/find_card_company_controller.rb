# frozen_string_literal: true

module Api
  module V1
    class FindCardCompanyController < ApplicationController
      def index
        @card_number = card_params[:card_number]

        valid_number, card_company = ValidateCreditCardNumber.run(
          @card_number
        )

        if valid_number
          flash[:notice] = "Number belongs to #{card_company}"
        else
          flash[:alert] = "Invalid card number for #{card_company}"
        end
        render 'home/index'
      rescue StandardError => e
        flash[:alert] = e.message
        render 'home/index'
      end

      private

      def card_params
        params.permit(:card_number)
      end
    end
  end
end
