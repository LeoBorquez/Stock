class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        #render json: @stock
        render partial: 'users/result' #render only the partial
      else
        flash[:danger] = "That symbol doesn't exist"
        redirect_to portafolio_path
      end
    else
      flash[:danger] = "You need the company Symbol"
      redirect_to portafolio_path
    end
  end

end
