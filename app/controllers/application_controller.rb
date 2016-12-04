class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :work_with_cookies
  before_action :set_locale

  def locale_en
    cookies[:locale] = 'en'
    I18n.locale = params[:locale]
    redirect_to root_url
  end

  def locale_ru
    cookies[:locale] = 'ru'
    I18n.locale = params[:locale]
    redirect_to root_url
  end


  private
    def set_locale
      I18n.locale = cookies[:locale] || 'en'
    end

    def work_with_cookies
      if cookies[:count]
        cookies[:count] = cookies[:count].to_i + 1
      else
        cookies[:count] = 0
      end

      if cookies[:count] == 10
        flash.now[:notice] = "!!!Учитесь вместе с GeekHub!!!"
        cookies[:count] = 0
      end
    end
end
