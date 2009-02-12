require "digest/sha1"

class User < ActiveRecord::Base  
  has_attached_file :mugshot, :styles => { :small => "150x150>" },
                    :url  => "/assets/mugshots/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/mugshots/:id/:style/:basename.:extension"
  
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password
  validates_confirmation_of :password

  
  validates_attachment_presence :mugshot
  validates_attachment_size :mugshot, :less_than => 5.megabytes
  validates_attachment_content_type :mugshot, :content_type => ['image/jpeg', 'image/png']
  
end
