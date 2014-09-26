class ContestsController < ApplicationController
  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.create_date_from_params params[:contest]
    redirect_to contests_path
  end

  def index
    @contests = Contest.all
  end

  def edit
    @contest = Contest.find(params[:id])
  end

  def update
    @contest = Contest.find(params[:id])
    @contest.update(contest_params) if @contest
    redirect_to contests_path
  end

  private

  def contest_params
    params.require(:contest).permit(
      :date
    )
  end
end
