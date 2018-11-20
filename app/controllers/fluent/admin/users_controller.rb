module Fluent
  class Admin::UsersController < Admin::AdminController
    def index
      @users_grid = Fluent::Datagrids::UsersGrid.new(params[:datagrids_users_grid]) do |scope|
        scope.page(params[:page])
      end

      respond_to do |format|
        if request.xhr? && !request.wiselinks?
          format.html{render partial: 'grid'}
        else
          format.html # index.html.erb
          format.json {render json: News}
        end
      end
    end

    def show
      @user = User.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @user }
      end
    end

    def new
      @user = User.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @user }
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          flash[:notice] = flash[:notice].to_a.concat @user.errors.full_messages
          format.html { redirect_to admin_users_path, :notice => 'User was successfully created.' }
          format.json { render :json => @user, :status => :created, :location => @user }
        else
          flash[:notice] = flash[:notice].to_a.concat @user.errors.full_messages
          format.html { render :action => "new"}
          format.json { render :json => @user.errors, :status => :unprocessable_entity }
        end
      end
    end

    def update
      @user = User.find(params[:id])
      @user.role_ids = params[:user][:role_ids] if params[:user]
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end

      respond_to do |format|
        if @user.update_attributes(user_params)
          format.html { redirect_to admin_users_path, :notice => 'User was successfully updated.' }
          format.json { head :ok }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @user.errors, :status => :unprocessable_entity }
        end
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy

      respond_to do |format|
        format.html { redirect_to admin_users_url }
        format.json { head :ok }
      end
    end

    private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :username, :role_ids)
    end

    def format_date date
      date.strftime("%B %e, %Y")
    end
  end
end
