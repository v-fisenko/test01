class LamersController < ApplicationController
  before_action :signed_in_lamer, only: [:edit, :update]
  before_action :correct_lamer,   only: [:edit, :update]

  def index
    @lamers = Lamer.all
  end

  def new
    @lamer = Lamer.new
  end

  def create
    @lamer = Lamer.new(lamer_params)
    if @lamer.save
      sign_in @lamer
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @lamer
    else
      render 'new'
    end
  end

  def show
    @lamer = Lamer.find(params[:id])
  end

  def edit
    #@lamer = Lamer.find(params[:id])
  end

  def update
    #@lamer = Lamer.find(params[:id])
    if @lamer.update_attributes(lamer_params)
      flash[:success] = "Profile updated"
      redirect_to @lamer
    else
      render 'edit'
    end
  end

  private

    def lamer_params
      params.require(:lamer).permit(:name, :email, :password, :password_confirmation )
    end

    def signed_in_lamer
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_lamer
      @lamer = Lamer.find(params[:id])
      redirect_to(root_url) unless current_lamer?(@lamer)
    end


end
