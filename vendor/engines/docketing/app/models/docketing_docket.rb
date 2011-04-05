class DocketingDocket < ActiveRecord::Base

  has_many :items, :class_name => 'DocketingItem', :dependent => :destroy,
    :inverse_of => :docket

  has_friendly_id :name, :use_slug => true

  acts_as_indexed :fields => [ :name ]

  validates :name, :presence => true, :uniqueness => true

end

