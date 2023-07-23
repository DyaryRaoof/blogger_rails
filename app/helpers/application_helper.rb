module ApplicationHelper
    def gravitar_for(user, options = {size: 80})
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(image_src, alt: user.username , class:"rounded-3 mx-auto d-block shadow-sm")
    end

    def current_user
        @current_user ||=  User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

end
