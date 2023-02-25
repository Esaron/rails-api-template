class Api::V1::ResourcesController < ApplicationController
  def index
    @resource = Resource.all
    render json: @resources
  end
end
