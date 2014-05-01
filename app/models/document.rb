class Document < ActiveRecord::Base
  belongs_to :crew
  DOC_TYPES = %w(certificate quarantine)

  validates :crew, presence: true

  validates :name, presence: true


  def to_s
    name
  end
end
