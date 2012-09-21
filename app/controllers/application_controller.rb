class ApplicationController < ActionController::Base
  protect_from_forgery #:except => [:destroy]

  before_filter :set_locale
  before_filter {
    @user = current_user
  }
    
  private
    def set_locale
      #debugger
      I18n.locale = DTT_FORCE_LOCALE || params[:locale] || (request.user_preferred_languages.first || 'en').scan(/^[a-z]{2}/).first
    end
  
    def default_url_options(options={})
      #logger.debug "default_url_options is passed options: #{options.inspect}\n"
      { :locale => I18n.locale }
    end
end
