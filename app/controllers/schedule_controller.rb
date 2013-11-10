class ScheduleController < ApplicationController
    skip_before_filter :verify_authenticity_token

    def bitcount(i)
        total = 0
        while i > 0
            if i % 2 == 1
                total += 1
            end
            i = i >> 1
        end
        return total
    end

    def create
        data = JSON.parse(request.body.read)
        class_id = data["class_id"]
        times = data["times"]
        @schoolclasstutors = Schoolclasstutor.where(schoolclass_id: class_id)
            .sort_by{ |x|
                -1 * bitcount(x.tutor.times & times)
        }
        render json: @schoolclasstutors.map! { |x|
            x.as_json(:include => :tutor)
        }
    end
end
