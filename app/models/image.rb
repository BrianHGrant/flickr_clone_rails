class Image < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "100x100#"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :description, presence: true
  belongs_to :user
  has_many :tags
  has_many :contents
end
