class GoalsController < ApplicationController

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    if @goal.save
      redirect_to user_url(current_user)
    else
      flash[:errors] = @goal.errors.full_messages
      render :new
    end
    
  end

  private
    def goal_params
      params.require(:goal).permit(:title, :body, :private)
    end

end
