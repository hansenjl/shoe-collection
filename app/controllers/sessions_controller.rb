class SessionsController < ApplicationController
#logging a user in, logging a user out, omniauth

    def omniauth  #log users in with omniauth
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to new_shoe_path
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to shoes_path
        end
    end

    private
    def auth
        request.env['omniauth.auth']
    end

end