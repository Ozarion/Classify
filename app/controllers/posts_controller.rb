class PostsController < ApplicationController
    before_action :authenticate, only: [:edit, :update, :destroy]
    def new
        @post.new
    end
    def create
        @post = current_user.posts.new(post_params)
    
        if @post.save
          flash[:notice] = "New post created"
          redirect_to posts_path(@post)
        else
          flash[:alert] = "Error creating new post"
          render 'new'
        end
    end
    def show
    end
    private
    def authenticate
        current_user.id == @post.user_id
    end


end
