class ToysController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.create!(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = find_toys
    toy.update!(toy_params)
    render json: toy
  end

  def destroy
    toy = find_toys
    toy.destroy!
    head :no_content
  end

  private
  

  def find_toys
    Toy.find(params[:id])
  end

  def toy_params
    params.permit(:name, :image, :likes)
  end

  def render_not_found_response
    render json: {error: "Toy Not Found"}, status: :not_found
  end

  def render_unprocessable_entity_response
    render json: {errors: invalid.record.errors}, status: :unprocessable_entity
  end

end
