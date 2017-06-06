class RaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :distance, :time, :race_day, :location, :race_pace

  def race_pace
    time_elasped = object.time
    distance = object.distance
    calculated_pace = (time_elasped / distance).floor
    pace_minutes = (calculated_pace / 60).floor
    pace_seconds = calculated_pace - (pace_minutes * 60)
    pace = "#{pace_minutes}:#{pace_seconds} min/mi"
    return pace
  end

end
