class RelationshipsController < ApplicationController
  def new
    @relationship = Relationship.new
  end

  def create
    @relationship = Relationship.new
    @relationship.save
  end
end
