class Crew < ActiveRecord::Base
  REPORT_TYPE = ["plain"]
  has_attached_file :picture,
    styles: { thumb: "80x80#",
              standard: "150x150#" },
    default_url: "/assets/:attachment/missing_:style.png"
  validates_attachment_content_type :picture, content_type: %w(image/jpg image/jpeg image/png)

  has_attached_file :signature,
    styles: { medium: "300x150#",
              list: "630x200#" },
    default_url: "/assets/:attachment/missing_:style.png"
  validates_attachment_content_type :picture, content_type: %w(image/jpg image/jpeg image/png)

  belongs_to :rank
  validates :rank, presence: true

  belongs_to :vessel
  validates :vessel, presence: true

  belongs_to :rank


  has_many :employment_records
  accepts_nested_attributes_for :employment_records

  has_many :educational_attainments
  accepts_nested_attributes_for :educational_attainments

  has_many :documents
  accepts_nested_attributes_for :documents

  has_many :licenses
  accepts_nested_attributes_for :licenses

  validates :date_employed, presence: true
  validates :code_number, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :birthday, presence: true
  validates :birthplace, presence: true
  validates :telephone_no, presence: true
  validates :height, presence: true, numericality: true
  validates :weight, presence: true, numericality: true
  validates :eye_color, presence: true
  validates :sss_no, presence: true, uniqueness: true
  validates :tin_no, presence: true, uniqueness: true
  validates :shoe_size, presence: true
  validates :cloth_size, presence: true
  validates :nearest_relative_name, presence: true
  validates :nearest_relative_relationship, presence: true
  validates :nearest_relative_address, presence: true
  validates :address, presence: true
  validates :civil_status, presence: true
  validates :nationality, presence: true
  validates :pagibig_number, presence: true
  validates :philhealth_number, presence: true

  def to_s
    "#{firstname} #{lastname}"
  end

  def to_s_list
    "#{lastname.upcase}, #{firstname}"
  end

  def age
    Time.now.year - birthday.year
  end

  def certificates
    self.documents.where(document_type: "certificate")
  end

  def quarantines
    self.documents.where(document_type: "quarantine")
  end
end
