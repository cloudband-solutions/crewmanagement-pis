class Crew < ActiveRecord::Base
  REPORT_TEMPLATES = ["baliwag", "misuga", "fleet_personnel", "dcm"]
  CIVIL_STATUSES = ["MARRIED", "SINGLE", "WIDOWED"]
  UNIFORM_SIZES = ["EXTRA SMALL", "SMALL", "MEDIUM", "LARGE", "EXTRA LARGE", "DOUBLE XL"]
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
  validates :crew_token, presence: true, uniqueness: true

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

  def manifest_status_color
    if !self.sign_on.nil?
      end_date = sign_on + 9.months
      current_date = Time.now

      difference = end_date.month - current_date.month
      puts "HERE: #{difference}"

      if ((end_date.year * 12 + end_date.month) - (current_date.year * 12 + current_date.month)) <= 3
        "#ffff4c"
      elsif ((end_date.year * 12 + end_date.month) - (current_date.year * 12 + current_date.month)) <= 6
        "#ff3232"
      else
        "#5EDF44"
      end
    end
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

    if self.crew_token.nil?
      self.crew_token = "#{SecureRandom.hex(4)}"
    end
  end

  def license_by_type(id)
    self.licenses.where(license_type_id: id).first
  end

  def employment_records_by_sign_off
    EmploymentRecord.where(crew_id: self.id).order(:sign_off)
  end

  def employment_records_by_sign_on
    EmploymentRecord.where(crew_id: self.id).order(:sign_on)
  end

  def build_json
    document_entries = []
    Document.where(crew_id: self.id).each do |d|
      document_entries << { doc_number: d.doc_number,
                            name: d.name,
                            issued_at: d.issued_at,
                            expiry_date: d.expiry_date,
                            issued_by: d.issued_by,
                            attachment: d.attachment.url,
                            document_kind: d.document_kind.to_s,
                            is_reverting: d.is_reverting }
    end

    educational_attainment_entries = []
    EducationalAttainment.where(crew_id: self.id).each do |e|
      educational_attainment_entries << { 
                            year_graduated: e.year_graduated,
                            school: e.school,
                            course_finished: e.course_finished
                                        }
    end

    licenses_entries = []
    License.where(crew_id: self.id).each do |l| 
      licenses_entries << {
                          type: l.license_type.name,
                          license_number: l.license_number,
                          date_issued: l.date_issued,
                          expiry_date: l.expiry_date,
                          issued_by: l.training_center.name

                          }
    end

    certificates_entries = []
    Certificate.where(crew_id: self.id).each do |cert|  
      certificates_entries << {
                            type: cert.name,
                            certificate_number: cert.certificate_number,
                            date_issued: cert.date_issued,
                            expiry_date: cert.expiry_date,
                            issued_by: cert.issued_by

                              }
    end

    employment_records_entries = []
    EmploymentRecord.where(crew_id: self.id).each do |er| 
      employment_records_entries << {
                                vessel: er.vessel.name,
                                flag: er.vessel.flag.name,
                                type: er.vessel.vessel_type.name,
                                manning_agent: er.manning_agent.name,
                                rank: er.rank.name,
                                sign_on: er.sign_on,
                                sign_off: er.sign_off,
                                reason: er.reason_for_disembarkation.to_s
                                  }
    end

    employment_records_index = []
    EmploymentRecord.where(crew_id: self.id).limit(5).each do |er| 
      employment_records_index << {
                                vessel: er.vessel.name,
                                flag: er.vessel.flag.name,
                                type: er.vessel.vessel_type.name,
                                manning_agent: er.manning_agent.name,
                                rank: er.rank.name,
                                sign_on: er.sign_on,
                                sign_off: er.sign_off,
                                reason: er.reason_for_disembarkation.to_s
                                  }
    end

    vessel_evaluation_entries = []
    CrewVesselEvaluation.where(crew_id: self.id).each do |ve| 
      vessel_evaluation_entries << {
                                  vessel: ve.vessel,
                                  vessel_e: ve.date_of_evaluation

                                   }
    end

    office_evaluation_entries = []
    CrewOfficeEvaluation.where(crew_id: self.id).each do |oe| 
      office_evaluation_entries << {
                                  vessel: oe.vessel,
                                  vessel_e: oe.date_of_evaluation

                                   }
    end

    c = {
      code_number: code_number,
      date_employed: date_employed,
      rank: rank.to_s,
      assigned_vessel: vessel,
      firstname: firstname,
      middlename: middlename,
      lastname: lastname,
      birhday: birthday,
      birthplace: birthplace,
      age: age,
      telephone_no: telephone_no,
      nationality: nationality,
      civil_status: civil_status,
      height: height,
      weight: weight,
      eye_color: eye_color,
      sss_no: sss_no,
      tin_no: tin_no,
      shoe_size: shoe_size,
      cloth_size: cloth_size,
      nearest_relative_name: nearest_relative_name,
      nearest_relative_relationship: nearest_relative_relationship,
      nearest_relative_address: nearest_relative_address,
      address: address,
      cellphone_no: cellphone_no,
      pagibig_number: pagibig_number,
      philhealth_number: philhealth_number,
      distinguishing_marks: distinguishing_marks,
      sign_on: sign_on,
      date_of_promotion: date_of_promotion,
      city_address: city_address,
      provincial_address: provincial_address,
      zip_code: zip_code,
      blood_type: blood_type,
      status: status,
      father_name: father_name,
      mother_maiden_name: mother_maiden_name,
      spouse_name: spouse_name,
      number_of_children: number_of_children,
      is_smoker: is_smoker,
      blood_pressure: blood_pressure,
      picture: "#{picture.url}",
      documents: document_entries,
      educational_attainments: educational_attainment_entries,
      licenses: licenses_entries,
      certificates: certificates_entries,
      employment_records: employment_records_entries,
      crew_vessel_evaluations: vessel_evaluation_entries,
      crew_office_evaluations: office_evaluation_entries,
      employment_records_index: employment_records_index
    }
  end
end
