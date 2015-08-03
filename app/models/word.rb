class Word < ActiveRecord::Base
  has_attached_file :avatar, 
    styles: { medium: "300x300>", thumb: "100x100>" }, 
    storage: :s3, 
    s3_credentials: {
      access_key_id: Settings.access_key_id,
      secret_access_key: Settings.secret_access_key,
      s3_host_name: "s3-ap-northeast-1.amazonaws.com",
      bucket: Settings.bucket
    },
#    s3_protocol: :https,
    url: 's3-ap-northeast-1.amazonaws.com',
    s3_endpoint: "s3-ap-northeast-1.amazonaws.com",
    path: '/:class/:attachment/:id_partition/:style/:filename',
    default_url: "/images/:style/missing.png"

  validates :text , length: {minimum: 4 , maximum: 10 } , presence: true
  validates :number, presence: true
  validates_attachment_presence :avatar
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  scope :text5, -> { where(number: 5) }
  scope :text7, -> { where(number: 7) }
  scope :permitted, -> { where(permit_flag: true) }

  scope :recent, -> { order("id DESC") } 
end
