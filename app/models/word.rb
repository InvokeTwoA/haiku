class Word < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"


  validates :text , length: {minimum: 4 , maximum: 10 } , presence: true
  validates_attachment_presence :avatar
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  scope :text5, -> { where(number: 5) }
  scope :text7, -> { where(number: 7) }

end
