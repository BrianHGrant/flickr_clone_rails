class Content < ActiveRecord::Base
  belongs_to :image
  validates_presence_of :name

  def self.search(search)
    if search
      where("name LIKE ?", "%#{search}%")
    else
      find(:all)
    end
  end
end
