class ApplicationController < ActionController::Base
  def index
    render status: 200, json: {:version => '2.0'}
  end
end
