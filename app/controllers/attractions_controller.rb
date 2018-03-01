class AttractionsController < ApplicationController
  def index

  end
  def show
    @attraction = Attraction.find(params[:id])
  end
end
