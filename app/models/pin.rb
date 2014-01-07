class Pin < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates :description, presence: true
  validates :image, presence: true

  searchable do
    text :description, :username
    time :created_at
  end

  # To run in 'rails console'
  # Pin.find(rand(30)).update_attributes(description: 'This beast is beast.')
  # Pin.find(rand(30)).update_attributes(description: 'What an inspiring creature.')
  # Pin.find(rand(30)).update_attributes(description: 'A magnificent, yet scary picture.')

  def username
    user.name
  end
end
