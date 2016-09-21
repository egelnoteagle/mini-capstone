class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      admin: false)

    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created an account!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password.'
      redirect_to '/signup'    
    end  
  end
end
