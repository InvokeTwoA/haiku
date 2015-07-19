class HaikuSet < ActiveRecord::Base
  validates_uniqueness_of :token
  validates_presence_of :token
  after_initialize :generate_hash

  def generate_hash
    tmp_token = SecureRandom.urlsafe_base64(6)
    self.class.where(token: tmp_token).blank? ? tmp_token : generate_hash
  end

end
