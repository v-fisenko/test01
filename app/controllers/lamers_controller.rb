class LamersController < ApplicationController
  def new
  end

  def show
    @lamer = Lamer.find(params[:id])
  end

end
