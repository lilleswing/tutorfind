class SchoolclassesController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def index
        render json: Schoolclass.all.to_json
    end

    def create
        data = JSON.parse(request.body.read)
        @schoolclass = Schoolclass.new(name: data["name"],
                                       description: data["description"])
        @schoolclass.save
        render json: @schoolclass.to_json
    end
end
