class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "You need the company Symbol"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "That symbol doesn't exist" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end

end

