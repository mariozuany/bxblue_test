class Weather < ApplicationRecord
  def self.conditions_list
    Weather.all.pluck(:condition)
  end
end
