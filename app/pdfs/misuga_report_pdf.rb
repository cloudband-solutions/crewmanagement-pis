class MisugaReportPdf < ApplicationController
	def initialize(crew, view)
  	super()

  	respond_to do |format|
  		format.html
  		format.pdf do
  			render :pdf => "MisugaReport",
  			:layout => "misuga",
  			:show_as_html => true
  		end
  	end
    
    #pdf = WickedPdf.new.pdf_from_html_file("#{Rails.root}/app/pdfs/templates/MisugaTemplate.html")
		#save_path = Rails.root.join('app/pdfs','MisugaReport.pdf')
    #File.open(save_path, 'wb') do |file|
    # file << pdf
    #end
  end
end
