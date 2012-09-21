
class HomeController < ApplicationController

  def index
  end

  # acces au rapport sans login
  def guest_report
    c = Company.find_by_permalink(params[:permalink])
    session[:guest_report_company] = nil

    if c.nil?
      flash[:notice] = t(:permalink_invalid)
      redirect_to root_path
    else
      unless user_signed_in?
        session[:guest_report_company] = c.id
      end
      redirect_to report_company_path(c)
    end
  end


  def choose_locale
    I18n.locale = params[:new_locale]
    redirect_to root_path
  end

end
