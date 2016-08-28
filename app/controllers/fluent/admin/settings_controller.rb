module Fluent
  class Admin::SettingsController < Admin::AdminController
    before_action :set_setting, only: [:show, :edit, :update, :destroy]

    def index
      @settings_grid = Fluent::Datagrids::SettingsGrid.new(params[:datagrids_settings_grid]) do |scope|
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
    end

    def new
      @setting = Setting.new
    end

    def edit
    end

    def create
      @setting = Setting.new(setting_params)

      respond_to do |format|
        if @setting.save
          format.html { redirect_to admin_settings_url, notice: 'Option was successfully created.' }
          format.json { render action: 'show', status: :created, location: @setting }
        else
          format.html { render action: 'new' }
          format.json { render json: @setting.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @setting.update(setting_params)
          format.html { redirect_to admin_settings_url, notice: 'Option was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @setting.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @setting.destroy
      respond_to do |format|
        format.html { redirect_to admin_settings_url }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_setting
        @setting = Setting.unscoped.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def setting_params
        params.require(:setting).permit(:var, :value)
      end
  end
end