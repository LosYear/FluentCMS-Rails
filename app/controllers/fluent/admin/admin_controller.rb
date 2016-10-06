module Fluent
  class Admin::AdminController < ApplicationController
    layout "fluent/admin"
    #wiselinks_layout

    def wiselinks_layout
      'fluent/admin_partial'
    end

    before_action :authenticate_user!, :verify_admin

    def verify_admin
      redirect_to main_app.fluent_path unless current_user.role?('admin')
    end

    def current_ability
      @current_ability ||= AdminAbility.new(current_user)
    end
  end
end
