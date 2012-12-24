class Post < ActiveRecord::Base

  attr_accessible :title, :body, :last_activity_at

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :subscriptions, as: :subscribable, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user
  belongs_to :user

  after_create do
    s = subscriptions.new last_read_at: Time.now
    s.user_id = user_id
    s.save
  end

end