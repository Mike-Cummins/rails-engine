class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response

  def record_not_found_response(error)
    render json: ErrorSerializer.error_json(error), status: 404
  end
end
