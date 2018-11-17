class Post < ApplicationRecord
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
    geocoded_by :address
    after_validation :geocode
  
    validates :title, :body, :cost, presence: true
    belongs_to :category
    belongs_to :user
  
  
  end
  