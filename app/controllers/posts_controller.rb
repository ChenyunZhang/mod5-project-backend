class PostsController < ApplicationController
    def index
        posts = Post.order("created_at DESC").all
        render json: posts
    end

    def create
        # byebug
            post = Post.create(post_params)
            if !!post
            render json: post
            else
                render json: {error: "error!!!"}
            end
        # byebug
    end

    def update
        # byebug
        post = Post.find(params[:id])
        post.update(post_params)
        render json: post
    end

    def destroy
        post = Post.find_by(id: params[:id])
        post.destroy
        render json: post
    end

    private
    def post_params
        params.permit(:content, :title, :user_id, :image, :book_id)
    end
end
