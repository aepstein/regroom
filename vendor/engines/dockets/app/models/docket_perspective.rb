class DocketPerspective < ActiveRecord::Base

  has_many :items, :class_name => 'DocketItem', :foreign_key => 'perspective_id',
    :dependent => :destroy, :inverse_of => :perspective

  validates :name, :presence => true, :uniqueness => true

end

