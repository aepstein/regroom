require 'state_machine'

class DocketingItem < ActiveRecord::Base

  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_user_id'
  belongs_to :docket, :inverse_of => :items, :class_name => 'DocketingDocket',
    :foreign_key => 'docketing_docket_id'
  belongs_to :perspective, :class_name => 'DocketingPerspective',
    :foreign_key => 'docketing_perspective_id', :dependent => :destroy,
    :inverse_of => :items

  acts_as_nested_set :scope => :docketing_docket

  acts_as_indexed :fields => [ :title, :content ]

  validates :docket, :presence => true
  validates :perspective, :presence => true
  validates :creator, :presence => true
  validates :title, :uniqueness => { :scope => :docketing_docket_id }
  validates :content, :presence => true
  validate :must_have_title_if_parent_is_blank

  state_machine :status, :initial => :submitted do
  end

  private

  def must_have_title_if_parent_is_blank
    if parent.blank? && title.blank?
      errors.add :title, "cannot be blank because this is a root item"
    end
  end

end

