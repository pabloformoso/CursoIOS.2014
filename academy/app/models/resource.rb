class Resource < ActiveRecord::Base

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "50x50>" }

  attr_accessible :description, :link, :name, :photo

  def image_url
    photo.url
  end
end
