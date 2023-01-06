# == Schema Information
#
# Table name: visits
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  short_url_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Visit < ApplicationRecord

  has_many :visitors
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
    dependent: :destroy

  has_many :visited_urls,
    through: :visitors,
    source: :visited_urls
end
