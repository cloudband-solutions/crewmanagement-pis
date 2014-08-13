class MisugaReportPdf < Prawn::Document
  def initialize(crew, view)
    super()
    text "This is a sample pdf"
  end
end
