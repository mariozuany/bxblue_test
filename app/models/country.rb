class Country < ApplicationRecord

  def self.names_list
    Country.all.pluck(:name)
  end

end
