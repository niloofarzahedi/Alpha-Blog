module Api
    module V1
      class ProfilesController < ApplicationController
        # Ensure only authenticated users can access these actions.
        before_action :authenticate_user!
  
        # GET /api/v1/profile
        def show
          # Returns the current user's profile
          render json: current_user, status: :ok
        end
  
        # PATCH /api/v1/profile
        def update
          if current_user.update(profile_params)
            render json: current_user, status: :ok
          else
            render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        private
  
        def profile_params
          # Permit only the fields you want to allow the user to update.
          params.require(:user).permit(:name, :email, :bio, :avatar)
        end
      end
    end
  end
  