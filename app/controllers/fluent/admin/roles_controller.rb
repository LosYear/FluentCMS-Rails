module Fluent
  class Admin::RolesController < Admin::AdminController
    # Preaload model
    before_action :set_role, only: [:show, :edit, :update, :destroy]

    def index
      @roles_grid = Datagrids::RolesGrid.new(params[:datagrids_roles_grid]) do |scope|
        scope.page(params[:page])
      end

      respond_to do |format|
        if request.xhr? && !request.wiselinks?
          format.html{render partial: 'grid'}
        else
          format.html # index.html.erb
          format.json {render json: Role}
        end
      end
    end

    def show
      redirect_to action: 'edit'
    end

    def new
      @role = Role.new
    end

    def edit
    end

    def create
      @role = Role.new(role_params)

      respond_to do |format|
        if @role.save
          format.html { redirect_to admin_roles_url, notice: 'Role was successfully created.' }
          format.json { render action: 'show', status: :created, location: @role }
        else
          format.html { render action: 'new' }
          format.json { render json: @role.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @role.update(role_params)
          format.html { redirect_to admin_roles_url, notice: 'Role was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @role.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @role.destroy
      respond_to do |format|
        format.html { redirect_to admin_roles_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_role
        @role = Role.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def role_params
        params.require(:role).permit(:name)
      end
  end
end