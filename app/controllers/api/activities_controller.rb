class Api::ActivitiesController < ApplicationController
  respond_to :json

  def index
    respond_with Activity.where(:party_id => params[:party_id]).find(:all, :order => "[order]")
  end

  def show
  	respond_with Activity.find(params[:id])
  end

  def create
    respond_with Activity.create(params[:activity])
  end

  def update
    respond_with Activity.update(params[:id], params[:activity])
  end

  def destroy
    respond_with Activity.destroy(params[:id])
  end
end
