class VotedownsController < ApplicationController

    def index
        votedowns = Votedown.all
        render json: votedowns
    end

    def create          
        exist_votedown = Votedown.find_by(user_id: params[:user_id], post_id:params[:post_id])
        if !exist_votedown
            votedown = Votedown.create(votedown_params)
            render json: votedown
        else
            render json: {error: "you voted down already"}
        end
    end

    def destroy
        votedown = Votedown.find_by(id: params[:id])
        votedown.destroy
        render json: votedown
    end

    private
    def votedown_params
        params.permit(:user_id, :post_id)
    end
end
