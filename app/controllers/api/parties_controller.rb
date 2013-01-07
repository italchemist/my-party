class Api::PartiesController < ApplicationController
  respond_to :json

  def index
    respond_with Party.all
  end

  def show
  	respond_with Party.find(params[:id])
  end

  def create
    respond_with Party.create(params[:party])
  end

  def update
    respond_with Party.update(params[:id], params[:party])
  end

  def destroy
    respond_with Party.destroy(params[:id])
  end
end
