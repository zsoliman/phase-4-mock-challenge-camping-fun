class SignupsController < ApplicationController

    def create
        signup = Signup.create(signup_params)
        activity = Activity.find_by(id: params[:activity_id])
        if signup.valid?
            render json: activity, status: 201
        else
            render json: {errors: signup.errors.full_messages}, status: 422
        end
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end
end
