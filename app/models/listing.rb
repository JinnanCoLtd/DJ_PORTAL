class Listing < ApplicationRecord
  belongs_to :user

  has_many :photographs
  has_many :reservations

  validates :location, presence: true
  validates :playing_years, presence: true
  validates :playing_per_year, presence: true
  validates :genre_main, presence: true

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

#項目の暗号化
	# ・各種アカウント
	# ・口座情報
	# ・カード番号
	# ・住所、電話番号、メールアドレス

end
