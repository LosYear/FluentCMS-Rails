module Fluent
  class Datagrids::NewsGrid
    include Datagrid

    scope do
      News.order('created_at DESC')
    end

    filter(:title, :string) do |value|
      query = "%#{value}%"
      self.where('title LIKE :search', search: query)
    end

    column(:title, :header => I18n.t('activerecord.attributes.fluent/news.title'), :html => true) do |record|
      link_to record.title, edit_admin_news_path(record), :data => {:push => true}
    end
    #column(:slug, :header => I18n.t('activerecord.attributes.news.slug'))
    column(:actions, :html => true, :header => I18n.t('backend_part.actions')) do |record|
      link_to(icon('pencil'), edit_admin_news_path(record), 'data-original-title' => t('backend_part.edit'), 'id' => 'tooltip', :data => {:push => true}) +
      link_to(icon('trash'), admin_news_path(record), 'data-original-title' => t('backend_part.remove'), 'id' => 'tooltip',  :method => :delete, :confirm => "#{t("backend_part.confirm")}", :data => {:push => true})
    end

  end
end