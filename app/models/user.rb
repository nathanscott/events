class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :posts,          dependent: :destroy
  has_many :comments,       dependent: :destroy
  has_many :subscriptions,  dependent: :destroy
  
  def subscription_for(subscribable)
    subscriptions.where(subscribable_id: subscribable.id).first
  end
  
  def notifications
    objects = []
    s = subscriptions
      .joins('INNER JOIN posts ON posts.id = subscriptions.subscribable_id')
      .where('posts.last_activity_at > subscriptions.last_read_at')
    s.each do |subscription|
      comments = subscription.subscribable.comments.where('created_at > ?', subscription.last_read_at)
      comments.each do |comment|
        objects.push({ type: 'comment', object: comment, subscribable: subscription.subscribable })
      end
    end
    objects
  end
  
end
