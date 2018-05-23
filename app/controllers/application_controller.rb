class ApplicationController < ActionController::API
  private

  def results_limit
    params[:limit] || 1000
  end
end
