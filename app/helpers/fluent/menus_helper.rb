module Fluent::MenusHelper
  # Renders ul list for menu
  # Params:
  # - menu: array with items
  # - options: hash with additional options, such as class name
  def render_menu menu, options = {}
    menu = Fluent::Menu.find_by(:name => menu).tree(:status => true)

    body = _render_menu menu, options
    if options.has_key? :class
      content_tag :ul, body, :class => options[:class]
    else
      content_tag :ul, body
    end
  end

  private
  def _render_menu menu, options
    menu.map do |key, item|
      data_push = item[:data_push]
      data_push = options[:data_push] if options.has_key? :data_push
      if item.has_key? :items
        content_tag :li do
          ((link_to item[:title], item[:url], :data => {:push => data_push}).html_safe + content_tag(:ul, _render_menu(item[:items])).html_safe).html_safe
        end
      else
        content_tag :li do
          (link_to item[:title], item[:url], :data => {:push => data_push}).html_safe
        end
      end
    end.join.html_safe
  end
end
