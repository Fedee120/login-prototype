class SessionsController < ApplicationController
    # POST /login
    def create
      user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: { status: 'Logged in successfully', user: user.as_json(except: [:password_digest]) }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    # DELETE /logout
    def destroy
      session[:user_id] = nil
      render json: { status: 'Logged out successfully' }, status: :ok
    end
  end
  