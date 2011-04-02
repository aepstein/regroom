class Docket < ActiveRecord::Base

  has_many :items, :class_name => 'DocketItem', :dependent => :destroy,
    :inverse_of => :docket

  acts_as_indexed :fields => [ :name ]

  validates :name, :presence => true, :uniqueness => true

end

