class VotedownsController < ApplicationController

    def index
        votedowns = Votedown.all
        render json: votedowns
    end

    def create          
        exist_votedown = Votedown.find_by(post_id: params[:post_id])
        if !exist_votedown
            votedown = Votedown.create(voteup_params)
            render json: votedown
        else
            render json: {error: "you voted up already"}
        end
    end

    def destroy
        byebug
        votedown = Votedown.find_by(id: params[:id])
        votedown.destroy
        render json: votedown
    end

    private
    def votedown_params
        params.permit(:user_id, :post_id)
    end
end
