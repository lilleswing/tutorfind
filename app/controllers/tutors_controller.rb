class TutorsController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def index
        render json: Tutor.all.as_json(:include => :schoolclasstutors)
    end

    def show
        classes = Schoolclasstutor.where("tutor_id", params[:id])
        json = Hash.new
        json["tutor"] = Tutor.find(params[:id]).as_json
        json["tutor"]["classes"] = classes.as_json
        render json: Tutor.find(params[:id]).as_json(:include => :schoolclasstutors)
    end

    def teach
        data = JSON.parse(request.body.read)
        pitch = data["pitch"]
        class_id = data["class_id"]
        tutor_id = params[:id]
        @schoolClassTutor = Schoolclasstutor.new
        @schoolClassTutor.schoolclass_id = class_id
        @schoolClassTutor.tutor_id = tutor_id
        @schoolClassTutor.pitch = pitch
        @schoolClassTutor.save
        render json: @schoolClassTutor
    end

    def create
        data = JSON.parse(request.body.read)
        @tutor = Tutor.new
        @tutor.user_id = data["user_id"]
        @tutor.times = data["times"]
        @tutor.save
        render json: @tutor
    end
end
