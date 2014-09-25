class JudgingTimesController < ApplicationController
  def new
    @judging_time = JudgingTime.new
  end

  def create
    @judging_time = JudgingTime.create!(params.require(:judging_time).permit(:time))
    @judging_time.contests << Contest.where(id: params[:judging_time][:contest_ids].last)

    redirect_to contests_path
  end
end
