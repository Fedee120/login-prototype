class UsersController < ApplicationController
    # Define callbacks at the top of the controller
    before_action :require_user, only: [:index]
  
    # POST /users
    def create
      user = User.new(user_params)
  
      if user.save
        render json: { status: 'User created successfully', user: user.as_json(except: [:password_digest]) }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def index
      # Filter the password_digest
      users = User.all.map do |user|
        user.as_json(except: [:password_digest])
      end
      render json: { users: users }, status: :ok
    end
  
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
  