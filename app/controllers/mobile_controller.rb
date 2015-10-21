class MobileController < ApplicationController
  before_action :is_adult_logged?, except: [:home, :adult?]

  layout :age_chivas_layout


  def home

  end

  def adult?
    fecha = (params[:birth]['(3i)'] + '-' + params[:birth]['(2i)'] + '-' + params[:birth]['(1i)']).to_date

    if fecha >= 18.years.ago #Menor de edad
      redirect_to home_path, alert: 'Usted es menor de edad. No puede acceder a este sitio.'
    else
      redirect_to start_path
      session[:is_adult?] = true
    end



  end

  def start
    @ganadores = Winner.all

  end


  def participate
    customer = Customer.find_by email: params[:email]

    if customer
      customer.invoices.create!([{number: params[:number], picture: params[:picture]}])
    else
      fecha = (params[:birth]['(3i)'] + '-' + params[:birth]['(2i)'] + '-' + params[:birth]['(1i)']).to_s

      customer = Customer.create(
          identification: params[:identification],
          name: params[:name],
          birth: fecha.to_s,
          mobile: params[:mobile],
          email: params[:email]
      )
      customer.invoices.create!([{number: params[:number], picture: params[:picture]}])
    end

    respond_to do |format|
      if customer.name
          format.html { redirect_to action: :start, anchor: 'inline'}
          format.js
        end
      end

  end


  protected
  def age_chivas_layout
    if action_name == 'home'
      false
    end
  end

  def is_adult_logged?
    unless session[:is_adult?]
      redirect_to home_path
    end
  end

end
