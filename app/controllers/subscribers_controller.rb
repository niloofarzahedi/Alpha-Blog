class SubscribersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post
  
    def create
        @subscriber = @post.subscribers.find_or_initialize_by(email: current_user.email)
        if @subscriber.persisted?
            flash[:alert] = "You are already subscribed."
            redirect_to @post and return
        end
        if @subscriber.save
            flash[:notice] = "You have successfully subscribed."
            redirect_to @post
        else
            flash[:alert] = "Subscription failed."
            redirect_to @post
        end
    end
    private
  
    def set_post
      @post = Post.find(params[:post_id])
    end
end
