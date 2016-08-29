class SessionsController < ApplicationController

  def new
  end

  def create
    lamer = Lamer.find_by(email: params[:session][:email].downcase)
    if lamer && lamer.authenticate(params[:session][:password])
      sign_in lamer
      redirect_back_or lamer

    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
