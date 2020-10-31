class PostsController < ApplicationController
    def index
        posts = Post.all
        render json: posts
    end

    def create
            post = Post.create(post_params)
            render json: post
        # byebug
    end

    private
    def post_params
        params.permit(:content, :title, :user_id, :category_id)
    end
end
