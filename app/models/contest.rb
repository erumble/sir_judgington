class Contest < ActiveRecord::Base
  has_many :entries
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :judging_times
  after_create :initialize_categories, :initialize_judging_times

  def has_category?(category)
    categories.include? category
  end

  def has_judging_time?(judging_time)
    available_judging_times.include? judging_time
  end

  def available_judging_times()
    time = []
    judging_times.each do |jt|
      time << jt if entries.where(judging_time: jt).count < 5
    end
    time
  end

  private

  def initialize_categories()
    categories << Category.where(common: true)
  end

  def initialize_judging_times()
    judging_times << JudgingTime.where(common: true)
  end
end
