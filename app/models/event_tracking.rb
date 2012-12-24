class EventTracking
  include Eventifier::EventTracking

  def initialize
    events_for Comment do
      track_on :create
      notify commentable: :subscribers, on: :create
    end
  end
end
