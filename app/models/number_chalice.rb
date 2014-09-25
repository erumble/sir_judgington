class NumberChalice < ActiveRecord::Base
  belongs_to :contest

  def next_hot_or_bulky
    hot_or_bulky + 1
  end

  def next_exhibition
    exhibition + 1
  end

  def next_regular
    regular + 1
  end
end
