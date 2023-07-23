class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user , only: [:edit, :update, :destroy]

    def index
        @users = User.paginate(page: params[:page], per_page: 2)
    end

    def show
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end

    def edit
    end


    def update
        if @user.update(user_params)
            flash[:notice] = "User updated successfully"
            redirect_to @user
        else
            render :edit, status: :unprocessable_entity
        end
    end


    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params) 
        if @user.save 
            sessions[:user_id] = @user.id
            flash[:notice] = "Succesfully signed up"
            redirect_to @user
        else
            render :new,  status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy 
        session[:user_id] = nil
        flash[:notice] = "User successfully removed from our database"
        redirect_to signup_path
    end

    private
    def user_params 
        params.require(:user).permit(:username, :password, :email)
    end

    def set_user
        @user = User.find(params[:id])
    end


    def require_same_user 
        if current_user != @user
            flash[:alert] = "You can only edit your own profile"
            redirect_to login_path
        end
    end
end