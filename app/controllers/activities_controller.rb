class ActivitiesController < ApplicationController

    def index
        activities = Activity.all
        render json: activities, include: :signups
    end 

    def delete
        activity = Activity.find_by(id: params[:id])
        if activity
            activity.signups.destroy_all
            activity.destroy
        else
            render json: {error: "Activity not found"}, status: 404
        end

    end 

end
