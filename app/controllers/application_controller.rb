class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :work_with_cookies



  private
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
