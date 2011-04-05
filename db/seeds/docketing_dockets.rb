User.all.each do |user|
  if user.plugins.where(:name => 'docketing').blank?
    user.plugins.create(:name => 'docketing',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Page.create(
  :title => 'Dockets',
  :link_url => '/docketing/dockets',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/(docketing|dockets?)(/|/.+?|)$'
)
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end

