module CrudController
  extend ActiveSupport::Concern

  included do
    before_action :find_resource, only: [:show, :update, :destroy]
  end

  def index
    @resources = resource_class.all
    render json: @resources
  end

  def show
    render json: @resource
  end

  def create
    @resource = resource_class.new(create_params)
    if @resource.save
      render json: @resource
    else
      render json: { errors: @resource.errors.full_messages }, status: 400
    end
  end

  def update
    @resource.update!(update_params)
    render json: @resource
  end

  def destroy
    @resource.destroy!
    head :no_content
  end

  private

  def create_params
    resource_params
  end

  def update_params
    resource_params
  end

  def find_resource
    @resource = resource_class.find(params[:id])
  end

  def resource_class
    controller_path.classify.safe_constantize
  end

  def resource_params
    params.permit(*resource_class.column_names)
  end
end
