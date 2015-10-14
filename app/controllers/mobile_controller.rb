class MobileController < ApplicationController

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


  def upload
    uploaded_io = params[:picture]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    #"http://#{request.host_with_port}/uploads/#{uploaded_io.original_filename}"
  end

end
