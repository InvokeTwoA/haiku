class HaikuSet < ActiveRecord::Base
  validates_uniqueness_of :token
  validates_presence_of :token
  before_create :generate_hash
  has_many :comments

  scope :popular, -> { where("comments_num > 0").order("comments_num DESC")} 

  def generate_hash
    Rails.logger.info "before create, generate hash"
    return if self.token.present?
    Rails.logger.info "let's create"
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

  def word1_text
    word = Word.find self.word1
    word.text
  end

  def word2_text
    word = Word.find self.word2
    word.text
  end
  def word3_text
    word = Word.find self.word3
    word.text
  end

  def word_text
    "#{word1_text}　#{word2_text}　#{word3_text}"
  end

  def word_ids
    "#{word1}-#{word2}-#{word3}"

  end
end
