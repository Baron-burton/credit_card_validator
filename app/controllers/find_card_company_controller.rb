# frozen_string_literal: true

class FindCardCompanyController < ApplicationController
  before_action :wipe_flash, only: :index

  def index
    @card_number = card_params[:card_number]

    valid_number, card_company = ValidateCreditCardNumber.run(
      @card_number
    )

    if valid_number
      flash[:notice] = "Valid number for #{card_company}"
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

  def wipe_flash
    flash.clear
  end
end
