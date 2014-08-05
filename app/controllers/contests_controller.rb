class ContestsController < ApplicationController
  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.create_date_from_params params[:contest]
    redirect_to entries_path
  end
end
