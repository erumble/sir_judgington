class Contest < ActiveRecord::Base
  has_one :number_chalice
  has_many :entries
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :judging_times
  before_create :build_number_chalice
  after_create :initialize_categories, :initialize_judging_times

  delegate :next_exhibition, :next_hot_or_bulky, :next_regular, to: :number_chalice


  def self.current
    where("date between ? and ?", Date.today.beginning_of_year, Date.today.end_of_year).first
  end

  def has_category?(category)
    categories.include? category
  end

  def has_judging_time?(judging_time)
    available_judging_times.include? judging_time
  end

  def available_judging_times
    time = []
    judging_times.each do |jt|
      time << jt if entries.where(judging_time: jt).count < 5
    end
    time
  end

  def self.create_date_from_params(params)
    Contest.create! date: Date.new(*(%w(1 2 3).map { |e| params["date(#{e}i)"].to_i }))
  end

  def aquire_pristine_virgin_number_from_chalice(series)
    retries = 0
    begin
      chalice_of_glorious_numbers = number_chalice.reload
      num = chalice_of_glorious_numbers.send("next_#{series.to_s}".to_sym)
      chalice_of_glorious_numbers.update!(series.to_sym => num)
      num
    rescue ActiveRecord::StaleObjectError
      raise if retries >= 3
      retries += 1
      retry
    end
  end

  private

  def initialize_categories
    categories << Category.where(common: true)
  end

  def initialize_judging_times
    judging_times << JudgingTime.where(common: true)
  end

end
