# frozen_string_literal: true

module Api
  module V1
    class FindCardCompanyController < ApplicationController
      def index
        valid_number, card_company = ValidateCreditCardNumber.run(
          card_params[:card_number]
        )

        if valid_number
          render json: { company: card_company }, status: :ok
        else
          render(
            json: { error: "Invalid card number for #{card_company}" },
            status: :not_found
          )
        end
      rescue StandardError => e
        render json: { error: e }, status: :unprocessable_entity
      end

      private

      def card_params
        params.require(:data).permit(:card_number)
      end
    end
  end
end
