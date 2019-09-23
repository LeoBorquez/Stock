class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        #render json: @stock
        respond_to do |format|
          format.js { render partial: 'users/result' } #render only the partial
        end
      else
        respond_to do |format|
          flash.now[:danger] = "That symbol doesn't exist"
          format.js { render partial: 'users/result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:danger] = "You need the company Symbol"
        format.js { render partial: 'users/result' }
      end
    end
  end

end
