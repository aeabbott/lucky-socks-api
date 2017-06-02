class Race < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :distance, presence: true
  validates :time, presence: true

end
