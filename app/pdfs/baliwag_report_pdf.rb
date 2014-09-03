class BaliwagReportPdf < Prawn::Document
  def initialize(crew, view)
    super()

    Prawn::Document.generate("app/pdfs/BaliwagReport.pdf", :margin=>[15]) do

    #Start Header
    	text "Form OFC-03", :size=>7
    	text "Revised 05 March 2014", :size=>7
    	pic_url = crew.picture.path(:standard).nil? ? "#{Rails.root}/app/assets/images/pictures/missing_standard.png" : crew.picture.path(:standard)
    	image pic_url, :width=>80, :height=>80, :at=>[0,740]
    	draw_text "BALIWAG NAVIGATION, INC.", :size=>13, :style=>:bold, :at=>[220,700], :character_spacing=>10
    	draw_text "B I O D A T A", :size=>13, :style=>:bold, :at=>[265,680], :character_spacing=>10

    	spacer = make_cell(:content=>"", :border_width => 0)

    	code_no = make_cell(:content=>"Code No:", :border_width => 0)
    	rank = make_cell(:content=>"Rank:", :border_width => 0)
    	date = make_cell(:content=>"Date:", :border_width => 0)
    	date_employed = make_cell(:content=>"Date Employed:", :border_width => 0)
    	code_no_value = make_cell(:content=>'', :border_width => 1, :borders=>[:bottom])
    	rank_value = make_cell(:content=>crew.rank.name, :border_width => 1, :borders=>[:bottom])
    	date_value = make_cell(:content=>Date.today.to_s, :border_width => 1, :borders=>[:bottom])
    	date_employed_value = make_cell(:content=>crew.date_employed.to_s, :border_width => 1, :borders=>[:bottom])
			data = [
				[code_no, code_no_value, rank, rank_value, date_employed, date_employed_value]
    	]
    	bounding_box([150, 670], :width => 800) do
    		table data, :column_widths=>[30,105,20,105,55,105], :cell_style=>{:size=>7,:align=>:left, :padding=>[2,0,2,0]}
    	end
    #End Header

    	name = make_cell(:content=>"Name:", :border_width => 0)
    	assigned_vessel = make_cell(:content=>"Assigned Vessel:", :border_width => 0)
    	name_value = make_cell(:content=>crew.to_s, :border_width => 1, :borders=>[:bottom])
    	assigned_vessel_value = make_cell(:content=>crew.vessel.name, :border_width => 1, :borders=>[:bottom])
    	data = [
    		[name, name_value, assigned_vessel, assigned_vessel_value]
    	]
    	table data, :column_widths=>[55, 360, 55, 100], :cell_style=>{:size=>7,:align=>:left, :padding=>[2,0,2,0]}

    	address = make_cell(:content=>"Address:", :border_width => 0)
    	telephone = make_cell(:content=>"Telephone:", :border_width => 0)
    	address_value = make_cell(:content=>crew.address, :border_width => 1, :borders=>[:bottom])
    	telephone_value = make_cell(:content=>crew.telephone_no, :border_width => 1, :borders=>[:bottom])
    	data = [
    		[address, address_value, telephone, telephone_value]
    	]
    	table data, :column_widths=>[55,360, 55, 100], :cell_style=>{:size=>7,:align=>:left, :padding=>[2,0,2,0]}

    	birthdate = make_cell(:content=>"Birthdate:", :border_width => 0)
    	age_text = make_cell(:content=>"Age:", :border_width => 0)
    	birthplace = make_cell(:content=>"Birth Place:", :border_width => 0)
    	nationality = make_cell(:content=>"Nationality:", :border_width => 0)

    	birthdate_value = make_cell(:content=>crew.birthday.to_s, :border_width => 1, :borders=>[:bottom])
    	age = Date.today.year - crew.birthday.year 
    	age -= 1 if crew.birthday > Date.today.years_ago( age )
    	age_value = make_cell(:content=>age.to_s, :border_width => 1, :borders=>[:bottom])
    	birthplace_value = make_cell(:content=>crew.birthplace, :border_width => 1, :borders=>[:bottom])
    	nationality_value = make_cell(:content=>crew.nationality, :border_width => 1, :borders=>[:bottom])
    	data =[
    		[birthdate, birthdate_value, age_text, age_value, birthplace, birthplace_value, nationality, nationality_value]
    	]
    	table data, :column_widths=>[55, 100, 50, 60, 50, 100, 55, 100], :cell_style=>{:size=>7,:align=>:left, :padding=>[2,0,2,0]}

    	civil_status = make_cell(:content => "Civil Status:", :border_width => 0)
    	weight = make_cell(:content => "Weight:", :border_width => 0)
    	height = make_cell(:content => "Height:", :border_width => 0)
    	eye = make_cell(:content => "Eye Color:", :border_width => 0)

    	status_value = make_cell(:content => crew.civil_status, :border_width => 1 , :borders => [:bottom])
    	height_value = make_cell(:content => crew.height.to_s, :border_width => 1 , :borders => [:bottom])
	  	weight_value = make_cell(:content => crew.weight.to_s, :border_width => 1 , :borders => [:bottom])
	  	eye_value = make_cell(:content => crew.eye_color, :border_width => 1 , :borders => [:bottom])

	  	data = [
	  		[civil_status, status_value, weight, weight_value, height, height_value, eye, eye_value]
	  	]
	  	table data, :column_widths=>[55, 100, 50, 60, 50, 100, 55, 100], :cell_style=>{:size=>7,:align=>:left, :padding=>[2,0,2,0]}

	  	sss = make_cell(:content => "SSS No.:", :border_width => 0)
	  	tin = make_cell(:content => "TIN:", :border_width => 0)
	  	shoe_size = make_cell(:content => "Shoe Size:", :border_width => 0)
	  	cloth_size = make_cell(:content => "Cloth Size:", :border_width => 0)

	  	relative_name = make_cell(:content => "Nearest Relative:", :border_width => 0)
	  	relative_rel = make_cell(:content => "Relationship:", :border_width => 0)
	  	relative_address = make_cell(:content => "Address:", :border_width => 0)
	  	relative_name_value = make_cell(:content => crew.nearest_relative_name, :border_width => 1 , :borders => [:bottom])
	  	relative_rel_value = make_cell(:content => crew.nearest_relative_relationship, :border_width => 1 , :borders => [:bottom])
	  	relative_address_value = make_cell(:content => crew.nearest_relative_address, :border_width => 1 , :borders => [:bottom])
	  	data =[
	  		[relative_name, relative_name_value, relative_rel, relative_rel_value, relative_address, relative_address_value]
	  	]
	  	table data, :column_widths=>[55, 100, 50, 60, 50, 255], :cell_style=>{:size=>7,:align=>:left, :padding=>[2,0,2,0]}

	  	
	  #Start Educational Attainment
	  	move_down 10
	  	text "EDUCATIONAL ATTAINMENT", :font_style=>:bold, :size=>10
	  	year_graduated = make_cell(:content => "Year", :font_style=>:bold, :align=>:center)
	  	school = make_cell(:content => "School", :font_style=>:bold, :align=>:center)
	  	course = make_cell(:content => "Course Finished", :font_style=>:bold, :align=>:center)
	  	data = [
	  		[year_graduated, school, course]
	  	]
	  	crew.educational_attainments.each do |educational_attainment|
	  		data << [educational_attainment.year_graduated, educational_attainment.school, educational_attainment.course_finished]
			end
	  	table data, :column_widths=>[70, 250, 250], :position=>:left, :width=>570, :cell_style=>{:size=>7,:padding=>[1,0,2,2]}
	  #End Educational Attainment

	  #Start Licenses & Certificates
	  	move_down 10
	  	text "LICENSES AND CERTIFICATES", :font_style=>:bold, :size=>10
	  	number = make_cell(:content => "Number", :font_style=>:bold, :align=>:center)
	  	date_issued = make_cell(:content => "Date Issued", :font_style=>:bold, :align=>:center)
	  	expiry_date = make_cell(:content => "Expiry Date", :font_style=>:bold, :align=>:center)
	  	issued_by = make_cell(:content => "Issued By", :font_style=>:bold, :align=>:center)
	  	data = [
	  		['', number, date_issued, expiry_date, issued_by]
	  	]

	  	crew.licenses.each do |license|
	  		data << [license.license_type.name, license.license_number.to_s, license.date_issued, license.expiry_date, license.issued_by]
	  	end

	  	table data, :column_widths=>[250, 100, 60, 60, 100], :position=>:left, :width=>570, :cell_style=>{:size=>7, :padding=>[1,0,2,2]}
	  #End Licenses & Certificates

	  #Start Employment Record
	  	move_down 10
	  	text "EMPLOYMENT RECORD", :font_style=>:bold, :size=>10
	  	vessel_name = make_cell(:content => "Vessel Name", :font_style=>:bold, :align=>:center)
	  	flag = make_cell(:content => "Flag", :font_style=>:bold, :align=>:center)
	  	type = make_cell(:content => "Type", :font_style=>:bold, :align=>:center)
	  	gross_tonnage = make_cell(:content => "Gross Tonnage", :font_style=>:bold, :align=>:center)
	  	manning_agent = make_cell(:content => "Manning Agent", :font_style=>:bold, :align=>:center)
	  	rank = make_cell(:content => "Rank", :font_style=>:bold, :align=>:center)
	  	sign_on = make_cell(:content => "Sign On", :font_style=>:bold, :align=>:center)
	  	sign_off = make_cell(:content => "Sign Off", :font_style=>:bold, :align=>:center)
	  	reason = make_cell(:content => "Reason of Disembarkation", :font_style=>:bold, :align=>:center)

	  	data =[
	  		[vessel_name, flag, type, gross_tonnage, manning_agent, rank, sign_on, sign_off, reason]
	  	]

	  	crew.employment_records.each do |employment|
	  		data << [employment.vessel.name, employment.vessel.flag.name, '', employment.vessel.grt, employment.manning_agent.to_s,'',employment.sign_on.to_s, employment.sign_off.to_s, employment.reason_for_disembarkation.to_s]
	  	end
	  	table data, :column_widths=>[70, 70, 60, 70, 60, 60, 60, 60, 60], :position=>:left, :width=>570, :cell_style=>{:size=>7, :padding=>[1,0,2,2], :valign=>:center}
	  #End Employment Record

    end #end prawn
  end
end #end class