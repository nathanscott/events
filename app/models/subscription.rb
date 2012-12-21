class Subscription < ActiveRecord::Base
  belongs_to :subscribable, polymorphic: true
  belongs_to :user

  attr_accessible :subscribable_id, :subscribable_type, :last_read_at
end