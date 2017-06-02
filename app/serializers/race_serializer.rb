class RaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :distance, :time, :race_day, :location
end
