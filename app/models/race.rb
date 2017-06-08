class Race < ApplicationRecord
  belongs_to :user

  # validates :name, presence: true
  validates :distance, presence: true
  validates :time, presence: true
  validates :race_day, presence: true
  validates :location, presence: true


end
