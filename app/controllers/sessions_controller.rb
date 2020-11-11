class SessionsController < ApplicationController

    def GoogleAuth
        # byebug
        # access_token = request.env["omniauth.auth"]
        # user = User.from_omniauth(access_token)
        # user.google_token = access_token.credentials.token
        # user.save
        # wristband_token = encode_token({user_id: user.id})
        # redirect_to "http://localhost:3001"
    end

    # don't know thow to send the information to the frontend

end

