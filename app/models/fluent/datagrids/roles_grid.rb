module Fluent
  class Datagrids::RolesGrid
    include Datagrid

    scope do
      Role
    end

    filter(:name, :string) do |value|
      query = "%#{value}%"
      self.where('name LIKE :search', search: query)
    end

    column(:name, :header => I18n.t('activerecord.attributes.fluent/role.name'), :html => true) do |record|
      link_to record.name, edit_admin_role_path(record), :data => {:push => true}
    end
    column(:actions, :html => true, :header => I18n.t('backend_part.actions')) do |record|
      link_to(icon('pencil'), edit_admin_role_path(record), 'data-original-title' => t('backend_part.edit'), 'id' => 'tooltip', :data => {:push => true}) +
      link_to(icon('trash'), admin_role_path(record), 'data-original-title' => t('backend_part.remove'), 'id' => 'tooltip',  :method => :delete, :confirm => "#{t("backend_part.confirm")}", :data => {:push => true})
    end
  end
end