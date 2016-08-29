module SessionsHelper

  def sign_in(lamer)
    remember_token = Lamer.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    lamer.update_attribute(:remember_token, Lamer.encrypt(remember_token))
    self.current_lamer = lamer
  end

  def signed_in?
    !current_lamer.nil?
  end

  def current_lamer=(lamer)
    @current_lamer = lamer
  end

  def current_lamer
    remember_token = Lamer.encrypt(cookies[:remember_token])
    @current_lamer ||= Lamer.find_by(remember_token: remember_token)
  end

  def current_lamer?(lamer)
    lamer == current_lamer
  end

  def sign_out
    current_lamer.update_attribute(:remember_token,
                                  Lamer.encrypt(Lamer.new_remember_token))
    cookies.delete(:remember_token)
    self.current_lamer = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end


end
