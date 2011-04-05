class DocketingPerspective < ActiveRecord::Base

  has_many :items, :class_name => 'DocketingItem', :dependent => :destroy,
    :inverse_of => :perspective

  has_friendly_id :name, :use_slug => true

  acts_as_indexed [ :name ]

  validates :name, :presence => true, :uniqueness => true

end

