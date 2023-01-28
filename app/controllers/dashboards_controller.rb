class DashboardsController < ApplicationController
  def index
    current_user.relationship.meet.relationship_id = current_user.relationship_id
    # @day_count = @meet.meet_day
    # @relationship = current_user.relationship
    # @meet = @relationship.meet.find(params[:id])
    user = User.find(current_user.id).includes(リレーションシップ: [:xxxx, :zzzz, :yyyyy])
    user.リレーションシップ.xxxx
    @relation = Relation.user
  end
end
