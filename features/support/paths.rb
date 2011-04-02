module NavigationHelpers
  module Refinery
    module RailsApplicationRoot
      def path_to(page_name)
        case page_name
        when /^#{capture_model}(?:'s)? page$/                           # eg. the forum's page
          path_to_pickle $1
        when /^#{capture_model}(?:'s)? #{capture_model}(?:'s)? page$/   # eg. the forum's post's page
          path_to_pickle $1, $2
        when /^#{capture_model}(?:'s)? #{capture_model}'s (.+?) page$/  # eg. the forum's post's comments page
          path_to_pickle $1, $2, :extra => $3                           #  or the forum's post's edit page
        when /^#{capture_model}(?:'s)? (.+?) page$/                     # eg. the forum's posts page
          path_to_pickle $1, :extra => $2                               #  or the forum's edit page
        # The following were added by ate2
        when /^the edit page for #{capture_model}$/
          edit_polymorphic_path( [model($1)] )
        when /^the new #{capture_factory} page$/
          new_polymorphic_path( [$1] )
        when /^the new #{capture_factory} page for #{capture_model}$/
          new_polymorphic_path( [model($2), $1] )
        when /^the(?: (\w+))? #{capture_plural_factory} page$/
          $1 ? polymorphic_path( [$1, $2] ) : polymorphic_path( [$2] )
        when /^the(?: (\w+))? #{capture_plural_factory} page for #{capture_model}$/
          $1 ? polymorphic_path( [$1, model($3), $2] ) : polymorphic_path( [model($3), $2] )
        when /^the(?: (\w+))? page for #{capture_model}$/
          polymorphic_path( [$1, model($2)] )
        else
          begin
            page_name =~ /the (.*) page/
            path_components = $1.split(/\s+/)
            self.send(path_components.push('path').join('_').to_sym)
          rescue Object => e
#            raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
#              "Now, go and add a mapping in #{__FILE__}"
            nil
          end
        end
      end
    end
  end
end

#World(NavigationHelpers)

