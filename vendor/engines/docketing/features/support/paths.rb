module NavigationHelpers
  module Refinery
    module Dockets
      def path_to(page_name)
        case page_name
        when /the list of dockets/
          admin_dockets_path

         when /the new docket form/
          new_admin_docket_path
        else
          nil
        end
      end
    end
  end
end
