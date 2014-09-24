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

  # def edit
  #   @contest = Contest.where(id: params[:id]).first
  # end
  #
  # def update
  #   @contest = Contest.where(id: params[:contest][:id]).first
  #   @contest.update_attributes(params[:contest]) if @contest
  #   redirect_to contests_path
  # end
end
