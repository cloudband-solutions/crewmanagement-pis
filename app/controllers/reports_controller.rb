class ReportsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def crew_manifest
    if request.post?
      if params[:vessel_id].blank?
        flash.now[:error] = "Please specify a vessel"  
      else
        @vessel = Vessel.find(params[:vessel_id])
        @license_types = LicenseType.where("license_types.id IN (?)", params[:license_types])
        @certificate_types = CertificateType.where("certificate_types.id IN (?)", params[:certificate_types])
        @crews = Crew.all_by_vessel(@vessel)
      end
    end
  end

  def download_crew_manifest
    crews = Crew.where("crews.id IN (?)", params[:crews].split(" "))
    vessel = Vessel.find(params[:vessel_id])
    license_types = LicenseType.where("license_types.id IN (?)", params[:license_type_ids].split(" "))
    certificate_types = CertificateType.where("certificate_types.id IN (?)", params[:certificate_types])
    prepared_by = params[:prepared_by]
    certified_by = params[:certified_by]
    noted_by = params[:noted_by]

    render(
      pdf: "sample",
      template: "reports/manifest_template",
      layout: false,
      orientation: 'Landscape',
      page_size: 'Legal',
      locals: { crews: crews, vessel: vessel, license_types: license_types, certificate_types: certificate_types, prepared_by: prepared_by, certified_by: certified_by, noted_by: noted_by }
    )
  end

  private 

  def generate_crew_manifest(vessel, crews, license_types)
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "Crew Manifest") do |sheet|
      labels = ["No.", "NAME", "Date of Birth", "Rank", "Sign On", "Date of Promotion"]
      license_types.each do |license_type|
        labels << license_type.name
      end
      sheet.add_row labels
      crews.each_with_index do |crew, index|
        crew_row = []
        i = index + 1
        crew_row << i
        crew_row << "#{crew.lastname.upcase} #{crew.firstname.upcase}"
        crew_row << crew.birthday.strftime('%d-%B-%Y')
        crew_row << crew.rank.name.upcase
        crew_row << crew.sign_on
        crew_row << ""
        license_types.each do |license_type|
          l = crew.licenses.where(license_type_id: license_type.id).first
          if !l.nil?
            crew_row << "#{l.license_number} - #{l.expiry_date.strftime('%d/%m/%Y')}"
          else
            crew_row << ""
          end
        end
        sheet.add_row crew_row
      end
    end
    package
  end
end
