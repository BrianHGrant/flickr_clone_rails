class Content < ActiveRecord::Base
  belongs_to :image
  validates_presence_of :name
end
