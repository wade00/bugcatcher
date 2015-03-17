class Project < ActiveRecord::Base
  has_many :releases, dependent: :destroy
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :screenshots, as: :screenshotable, dependent: :destroy

  has_attached_file :logo,
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :default_url => "default_logo.png"

  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :description, presence: true
  validates :owner, presence: true

  accepts_nested_attributes_for :screenshots, allow_destroy: true

  paginates_per 10

end
