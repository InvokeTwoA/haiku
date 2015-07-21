class HaikuSet < ActiveRecord::Base
  validates_uniqueness_of :token
  validates_presence_of :token
  before_create :generate_hash
  has_many :comments

  scope :popular, -> { where("comments_num > 0").order("comments_num DESC")} 

  def generate_hash
    tmp_token = SecureRandom.urlsafe_base64(6)
    if self.class.where(token: tmp_token).blank?
      self.token = tmp_token
    else
      generate_hash
    end
  end

  def pv_up
    self.pv = self.pv+1
    self.save!
  end
end
