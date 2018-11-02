class Post < ApplicationRecord
  belongs_to :user

  scope :user, -> { joins(:users).includes(:users).where( 'users.id = user_id') }
  scope :city, ->(city) { where city: city }
  scope :country, ->(country) { where country: country }
  scope :temperature_celsius, ->(temperature_celsius) { where temperature_celsius: temperature_celsius }
  scope :weather_condition, ->(weather_condition) { where weather_condition: weather_condition }

  validates :body, presence: true, length: { minimum: 5 }
  validates :city, presence: true, length: { minimum: 3 }
  validates :country, presence: true, inclusion: {in: Country.names_list, allow_blank: false, message: 'Country not on our list.'}
  validates :weather_condition, presence: true, inclusion: {in: Weather.conditions_list, allow_blank: false, message: 'Condition not on our list.'}
end
