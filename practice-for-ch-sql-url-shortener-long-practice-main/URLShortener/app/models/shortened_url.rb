# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true
  validates :user_id, presence: true
  
  after_initialize do |long_url|
    if self.new_record?(long_url)
        new_url = generate_short_url
        self.short_url = new_url 
    end
  end

  def self.random_code
    short = false

    until short
      shortened = SecureRandom.urlsafe_base64
      short = true unless self.exist?(:short_url: shortened)
    end
    shortened
  end

private

def generate_short_url
  ShortenedUrl.random_code
end


end
