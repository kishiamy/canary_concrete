class ErrorController < ApplicationController
  skip_before_filter :set_locale

  def error_404
    render status: 404  
  end
end
