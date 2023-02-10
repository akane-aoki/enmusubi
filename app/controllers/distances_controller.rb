class DistancesController < ApplicationController
  def index
    @partner = User.where.not(id: current_user.id).find_by(relationship_id: current_user.relationship_id)
    if @partner.nil?
      return
    elsif @partner
      @partner.name
    end

    @distance = Geocoder::Calculations.distance_between([current_user.latitude,current_user.longitude],[@partner.latitude,@partner.longitude]).round
  end

  def show
  end
end
