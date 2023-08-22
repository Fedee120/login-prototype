class ApplicationController < ActionController::API
      
        private
      
        def current_user
          @current_user ||= User.find(session[:user_id]) if session[:user_id]
        end

        def require_user
            unless current_user
              render json: { error: 'You must be logged in to perform this action' }, status: :unauthorized
            end
        end
          
end
