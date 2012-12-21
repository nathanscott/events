class Comment < ActiveRecord::Base
  
  attr_accessible :body, :commentable_id, :commentable_type
  
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  scope :ordered, order: 'created_at ASC'

  after_create do
    commentable.update_attributes last_activity_at: Time.now
    subscription = user.subscription_for(commentable)
    logger.debug "###############################"
    logger.debug subscription
    logger.debug "###############################"
    unless subscription.present?
      s = user.subscriptions.new last_read_at: Time.now
      s.subscribable = commentable
      s.save()
    end
  end
end
