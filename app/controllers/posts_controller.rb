class PostsController < ApplicationController
  expose(:posts) { Post.all }
  expose(:post)
  expose(:comment) { post.comments.new }
  expose(:subscription) { post.subscription.new }
  
  def create
    post = current_user.posts.new(params[:post])
    if post.save
      redirect_to post
    else
      render :edit
    end
  end
  
  def show
    subscription = current_user.subscription_for(post)
    if subscription
      subscription.update_attributes last_read_at: Time.now
    end
  end
end
