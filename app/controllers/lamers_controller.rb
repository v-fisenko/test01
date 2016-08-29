class LamersController < ApplicationController
  before_action :signed_in_lamer, only: [:edit, :update]

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
    @lamer = Lamer.find(params[:id])
  end

  def update
    @lamer = Lamer.find(params[:id])
    if @lamer.update_attributes(lamer_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @lamer
    else
      render 'edit'
    end
  end

  private

    def lamer_params
      params.require(:lamer).permit(:name, :email,  
                                   :password, :password_confirmation
                                   )
    end

    def signed_in_lamer
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

end
