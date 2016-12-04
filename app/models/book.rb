class Book < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, required: true
  has_many :reviews

  has_attached_file :book_img,
                    styles: { book_index: "250x350>", book_show: "325x475>" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\z/

  def average_review
    reviews.empty? ? 0 : reviews.average(:rating).round(2)
  end
end
