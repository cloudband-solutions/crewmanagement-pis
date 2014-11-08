class Crew < ActiveRecord::Base
  REPORT_TEMPLATES = ["baliwag", "misuga", "fleet_personnel"]
  CIVIL_STATUSES = ["MARRIED", "SINGLE", "WIDOWED"]
  UNIFORM_SIZES = ["EXTRA SMALL", "SMALL", "MEDIUM" "LARGE", "EXTRA LARGE"]
  STATUSES = ["ACTIVE", "INACTIVE", "DECEASED"]

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
  #validates :vessel, presence: true

  belongs_to :rank

  has_many :employment_records
  accepts_nested_attributes_for :employment_records, allow_destroy: true

  has_many :educational_attainments
  accepts_nested_attributes_for :educational_attainments, allow_destroy: true

  has_many :documents
  accepts_nested_attributes_for :documents, allow_destroy: true

  has_many :licenses
  accepts_nested_attributes_for :licenses, allow_destroy: true

  has_many :certificates
  accepts_nested_attributes_for :certificates, allow_destroy: true

  has_many :crew_office_evaluations
  accepts_nested_attributes_for :crew_office_evaluations, allow_destroy: true

  has_many :crew_vessel_evaluations
  accepts_nested_attributes_for :crew_vessel_evaluations, allow_destroy: true

  validates :date_employed, presence: true
  validates :code_number, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :middlename, presence: true
  validates :birthday, presence: true
  validates :birthplace, presence: true
  validates :telephone_no, presence: true
  validates :height, presence: true, numericality: true
  validates :weight, presence: true, numericality: true
  validates :eye_color, presence: true
  validates :shoe_size, presence: true
  validates :cloth_size, presence: true
  validates :nearest_relative_name, presence: true
  validates :nearest_relative_relationship, presence: true
  validates :nearest_relative_address, presence: true
  validates :address, presence: true
  validates :civil_status, presence: true, inclusion: { in: Crew::CIVIL_STATUSES }
  validates :nationality, presence: true
  validates :is_archived, inclusion: { in: [true, false] }
  validates :status, presence: true, inclusion: { in: Crew::STATUSES }

  before_validation :load_defaults

  scope :active_by_rank, -> { includes(:rank).where("is_archived = ?", false).order("ranks.priority ASC") }

  scope :active, -> { where("is_archived = ?", false) }

  def self.all_by_vessel(v)
    self.active_by_rank.where(vessel_id: v.id)
  end

  def to_s
    "#{firstname.upcase} #{middlename.upcase} #{lastname.upcase}"
  end

  def to_s_list
    "#{lastname.upcase}, #{firstname.upcase} #{middlename.upcase}"
  end

  def age
    Time.now.year - birthday.year
  end

  def toggle_archive
    if self.is_archived != true
      self.is_archived = true
    else
      self.is_archived = false
    end
  end

  def load_defaults
    if self.new_record?
      self.is_archived = 'f'
    end
  end

  def license_by_type(id)
    self.licenses.where(license_type_id: id).first
  end
end
