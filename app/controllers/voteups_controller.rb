class VoteupsController < ApplicationController

    def index
        voteups = Voteup.all
        render json: voteups
    end

    def create          
        exist_voteup = Voteup.find_by(user_id: params[:user_id])
        if !exist_voteup
            voteup = Voteup.create(voteup_params)
            render json: voteup
        else
            render json: {error: "you voted up already"}
        end
    end

    def destroy
        byebug
        voteup = Voteup.find_by(id: params[:id])
        voteup.destroy
        render json: voteup
    end

    private
    def voteup_params
        params.permit(:user_id, :post_id)
    end
end
