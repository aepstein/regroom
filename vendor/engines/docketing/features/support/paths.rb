module NavigationHelpers
  module Refinery
    module Dockets
      def path_to(page_name)
        case page_name
        when /the list of dockets/
          admin_docketing_dockets_path

        when /the new docket form/
          new_admin_docketing_docket_path

        when /the list of perspectives/
          admin_docketing_perspectives_path

        when /the new perspective form/
          new_admin_docketing_perspective_path
        else
          nil
        end
      end
    end
  end
end

