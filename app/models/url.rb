class Url < ApplicationRecord
  include Urls::GrabContent
  serialize :tags
  # has_many :contents, dependent: :destroy

  validates :url, presence: true, uniqueness: true
  validates :url, format: { with: URI.regexp }
  # validate :url_accessible

  # private
  # def url_accessible
  #   # errors.add(:volume, “cannot be above 400 cubic inches”) if url_
  # end
  #
  # def url_valid?
  #   url = URI.parse(url) rescue false
  #   url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
  # end
end
