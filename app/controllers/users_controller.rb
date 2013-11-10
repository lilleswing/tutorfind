require 'json'

class UsersController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def index
        render json: User.all.to_json
    end

    def create
        @user = User.new.from_json(request.body.read)
        @user.save
        render json: @user.to_json
    end
end
