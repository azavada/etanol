class ApplicationController < ActionController::Base
  def index
    render status: 200, json: @controller.to_json
  end
end
