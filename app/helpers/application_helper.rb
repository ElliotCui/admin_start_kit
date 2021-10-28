module ApplicationHelper
  def flash_class(level)
    case level
    when :notice, 'notice'    then "text-info"
    when :success, 'success'  then "text-success"
    when :error, 'error'      then "text-danger"
    when :alert, 'alert'      then "text-warning"
    end
  end

  def nav_link(text, url, *controllers, ignore_actions: [], assign_actions: [])
    active = active_class?(*controllers, ignore_actions, assign_actions) ? 'active' : ''

    link_to url, class: "list-group-item list-group-item-action #{active}" do
      content_tag :div, class: 'd-flex w-100 justify-content-start align-items-center' do
        content_tag(:span, text, class: ['menu-collapsed'])
      end
    end
  end

  def nav_menu(text, additional_klass: "", &block)
    raise "必须要传递 nav_submenu" unless block_given?

    menu_id = "id-#{SecureRandom.alphanumeric(10)}"
    submenu_id = "id-#{SecureRandom.alphanumeric(10)}"
    capture do
      concat(
        link_to("##{submenu_id}", 'aria-expanded': false, id: menu_id, class: "list-group-item list-group-item-action flex-column align-items-start collapsed #{additional_klass}", data: { toggle: 'collapse' }) do
          capture do
            concat(
              content_tag(:div, class: 'd-flex w-100 justify-content-start align-items-center') do
                concat content_tag(:span, text, class: 'menu-collapsed')
                concat tag(:span, class: 'submenu-icon ml-auto')
              end
            )
          end
        end
      )
      concat(
        content_tag(:div, class: "collapse sidebar-submenu", id: submenu_id, data: { 'menu-id': menu_id }) do
          capture(&block)
        end
      )
    end
  end

  def nav_submenu(text, url, *controllers, ignore_actions: [], assign_actions: [], additional_klass: "")
    active = active_class?(*controllers, ignore_actions, assign_actions) ? 'active' : ''

    link_to(url, class: "list-group-item list-group-item-action submenu-action #{active} #{additional_klass}") { content_tag :span, "- #{text}", class: 'menu-collapsed' }
  end

  private

  def active_class?(*controllers, ignore_actions, assign_actions)
    return false if ignore_actions.present? && ignore_actions.include?(params[:action].to_s)
    return false if assign_actions.present? && !assign_actions.include?(params[:action].to_s)

    controllers.select { |c| params[:controller].to_s == c }.present?
  end
end
