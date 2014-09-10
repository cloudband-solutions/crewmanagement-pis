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

    	font("Helvetica", :size => 7)

    	bounding_box([410,680],:width => 160) do
    		date = make_cell(:content=>"Date:", :border_width => 0)
    		date_value = make_cell(:content=>Date.today.to_s, :border_width => 1, :borders=>[:bottom])
    		data = [
    			[date, date_value]
    		]
    		table data, :column_widths=>[55,105], :cell_style=>{:align=>:left, :padding=>[2,0,2,0]}
    	end

    	code_no = make_cell(:content=>"Code No:", :border_width => 0)
    	rank = make_cell(:content=>"Rank:", :border_width => 0)
    	date = make_cell(:content=>"Date:", :border_width => 0)
    	date_employed = make_cell(:content=>"Date Employed:", :border_width => 0)
    	code_no_value = make_cell(:content=>crew.code_number, :border_width => 1, :borders=>[:bottom])
    	rank_value = make_cell(:content=>crew.rank.name, :border_width => 1, :borders=>[:bottom])
    	date_value = make_cell(:content=>Date.today.to_s, :border_width => 1, :borders=>[:bottom])
    	date_employed_value = make_cell(:content=>crew.date_employed.to_s, :border_width => 1, :borders=>[:bottom])
			data = [
				[code_no, code_no_value, rank, rank_value, date_employed, date_employed_value]
    	]
    	bounding_box([150, 670], :width => 800) do
    		table data, :column_widths=>[30,105,20,105,55,105], :cell_style=>{:align=>:left, :padding=>[2,0,2,0]}
    	end
    #End Header

    	name = make_cell(:content=>"Name:", :border_width => 0)
    	assigned_vessel = make_cell(:content=>"Assigned Vessel:", :border_width => 0)
    	name_value = make_cell(:content=>crew.to_s, :border_width => 1, :borders=>[:bottom])
    	assigned_vessel_value = make_cell(:content=>crew.vessel.name, :border_width => 1, :borders=>[:bottom])
    	data = [
    		[name, name_value, assigned_vessel, assigned_vessel_value]
    	]
    	table data, :column_widths=>[55, 360, 55, 100], :cell_style=>{:align=>:left, :padding=>[2,0,2,0]}

    	address = make_cell(:content=>"Address:", :border_width => 0)
    	telephone = make_cell(:content=>"Telephone:", :border_width => 0)
    	address_value = make_cell(:content=>crew.address, :border_width => 1, :borders=>[:bottom])
    	telephone_value = make_cell(:content=>crew.telephone_no, :border_width => 1, :borders=>[:bottom])
    	data = [
    		[address, address_value, telephone, telephone_value]
    	]
    	table data, :column_widths=>[55,360, 55, 100], :cell_style=>{:align=>:left, :padding=>[2,0,2,0]}

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
    	table data, :column_widths=>[55, 100, 50, 60, 50, 100, 55, 100], :cell_style=>{:align=>:left, :padding=>[2,0,2,0]}

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
	  	table data, :column_widths=>[55, 100, 50, 60, 50, 100, 55, 100], :cell_style=>{:align=>:left, :padding=>[2,0,2,0]}

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
	  	table data, :column_widths=>[55, 100, 50, 60, 50, 255], :cell_style=>{:align=>:left, :padding=>[2,0,2,0]}

	  	
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
	  	table data, :column_widths=>[70, 250, 250], :position=>:left, :width=>570, :cell_style=>{:padding=>[1,0,2,2]}
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
	  		data << [license.license_type.name, license.license_number.to_s, license.date_issued.to_s, license.expiry_date.to_s, license.training_center.to_s]
	  	end

	  	table data, :column_widths=>[250, 100, 60, 60, 100], :position=>:left, :width=>570, :cell_style=>{:padding=>[1,0,2,2]}
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
	  		data << [employment.vessel.name, employment.vessel.flag.name, "#{employment.vessel.vessel_type}", employment.vessel.grt, employment.manning_agent.to_s,employment.rank.name,employment.sign_on.to_s, employment.sign_off.to_s, employment.reason_for_disembarkation.to_s]
	  	end
	  	table data, :column_widths=>[70, 70, 60, 70, 60, 60, 60, 60, 60], :position=>:left, :width=>570, :cell_style=>{:padding=>[1,0,2,2], :valign=>:center}
	  #End Employment Record

	  	start_new_page

	  	text "BALIWAG NAVIGATION, INC.", :align=>:center, :size=>10, :style=>:bold
	  	text "Crew Data", :align=>:center, :size=>10

	  	move_down 10

	  	font("Helvetica", :size => 10)

	  	data = [
	  		["Name: #{crew.to_s}", "Position: #{crew.rank.name}","Vsl Name: #{crew.vessel.name}"]
	  	]
	  	table data, :column_widths => [270,150,150], :cell_style=>{:padding=>[0,0,2,2], :valign=>:center}

	  	data = [
	  		["Address / Tel. #{crew.address} / #{crew.telephone_no}", "Nationality: #{crew.nationality}"]
	  	]
	  	table data, :column_widths => [450,120], :cell_style=>{:padding=>[0,0,2,2], :valign=>:center}

	  	data = [
	  		["Date of Birth/Place: #{crew.birthday}/#{crew.birthplace}", "Age: #{age.to_s}", "Height: #{crew.height.to_s}", "Weight: #{crew.weight}"]
	  	]
	  	table data, :column_widths => [250,100,100,120], :cell_style=>{:padding=>[0,0,2,2], :valign=>:center}

	  	data =[
	  		["Civil Status: #{crew.civil_status}","Next of Kin: #{crew.nearest_relative_relationship}", "Name: #{crew.nearest_relative_name}", "Eye Color: #{crew.eye_color}"]
	  	]
	  	table data, :column_widths => [125, 125, 200, 120], :cell_style=>{:padding=>[0,0,2,2], :valign=>:center}

	  	data = [
	  		["Children: #{crew.number_of_children}","Addess: #{crew.nearest_relative_address}", "Shoe Size: #{crew.shoe_size}"]
	  	]
	  	table data, :column_widths => [125,325,120], :cell_style=>{:padding=>[0,0,2,2], :valign=>:center}

	  	data = [
	  		["<b>LICENSE & CERTIFICATE</b>",make_cell(:content=>"NO.", :align=>:center),make_cell(:content=>"ISSUED DATE", :align=>:center),make_cell(:content=>"VALIDITY", :align=>:center), make_cell(:content=>" ", :border_width=>1, :borders=>[:right])]
	  	]
	  	crew.licenses.each do |license|
	  		data << [license.license_type.name, license.license_number.to_s, license.date_issued, license.expiry_date, make_cell(:content=>" ", :border_width=>1, :borders=>[:right])]
	  	end

	  	table data, :column_widths => [125,100,100,100,145], :cell_style=>{:padding=>[0,0,2,2], :valign=>:center, :inline_format=>true}

	  	data = [
	  		["History of this company:","Date of Employment\n#{crew.date_employed}","Years of Sea Service\n___years\s\s___months"]
	  	]
	  	table data, :column_widths => [370, 100, 100], :cell_style=>{:padding=>[0,0,2,2], :valign=>:top, :inline_format=>true}

	  	data =  [
	  		["Sea service of this position (vessel)","Blood Type: #{crew.blood_type}","Blood Pressure: #{crew.blood_pressure}"]
	  	]
	  	table data , :column_widths => [300, 135, 135], :cell_style=>{:padding=>[0,0,2,2], :valign=>:top, :inline_format=>true}

	  	data =[
	  		["<b>EDUCATION: </b> School Name ",make_cell(:content=>"Course Finished", :align=>:center), "Graduated Year"]
	  	]
	  	crew.educational_attainments.each do |educational_attainment|
	  		data << [educational_attainment.school, educational_attainment.course_finished, educational_attainment.year_graduated]
			end
			table data, :column_widths => [225, 200, 145], :cell_style=>{:padding=>[0,0,2,2], :valign=>:center, :inline_format=>true}

			move_down 5

			data = [
				[make_cell(:content=>'LANGUAGE: To be inserted round marks: ex. "O" in applicable column and name of other laguage will be put in column', :colspan=>4)],
				["English", "Well:\s\s\s\s\s\s\s\s Average:\s\s\s\s\s\s\s\s A Little:\s\s\s\s\s\s\s\s No:", "(others)", "Well:\s\s\s\s Average:\s\s\s\s A Little:\s\s\s\s No:"]
			]
			table data, :column_widths => [70, 255, 50, 195], :cell_style=>{:padding=>[0,0,2,2], :valign=>:center, :inline_format=>true}
			move_down 5
			text "SEAMAN'S SERVICE RECORD", :align=>:center, :style=>:bold
			move_down 3
			data = [
				["<b>VSL NAME</b>", "<b>Rank</b>", "<b>Flag</b>","<b>Main Eng. Maker</b>", "<b>Grade</b>", "<b>Sign On/Off</b>"],
				[make_cell(:content=>"<b>MANG. COMPANY/PRINCIPAL</b>",:colspan=>2),"<b>Vsl Type / GRT</b>", "<b>ENG. TYPE / BHP</b>", "<b>Evaluation</b>", "<b>Reason for Sign Off</b>"]
			]
			table data, :column_widths => [125,100,100,100,50,95], :cell_style=>{:padding=>[0,0,2,2], :valign=>:center, :align=>:center, :inline_format=>true, :size=>9}

			data = []
			crew.employment_records.each do |er|
				data << [er.vessel.name, er.rank.name, "#{er.vessel.flag.name}\n#{er.vessel.vessel_type}/#{er.vessel.grt}", "#{er.vessel.engine_make}\n#{er.vessel.engine_model}/#{er.vessel.horse_power}","\s","#{er.sign_on.to_s} / #{er.sign_off.to_s}\n#{er.reason_for_disembarkation.to_s}"]
			end

      if data.count > 0
        table data, :column_widths => [125,100,100,100,50,95], :cell_style=>{:padding=>[0,0,2,2], :valign=>:center, :inline_format=>true}
      end

			data = [
				["<b>Grade of Evaluation:</b> (1): Excellent\s\s\s\s\s\s\s\s(2): Very Good\s\s\s\s\s\s\s\s(3): Good\s\s\s\s\s\s\s\s(4): Fair\s\s\s\s\s\s\s\s(5): Poor"]
			]
			table data, :width => 570, :cell_style=>{:padding=>[0,0,2,2], :valign=>:center, :inline_format=>true}

			move_down 5
			text "First Marine Services Co. Ltd.", :align=>:center, :style=>:bold, :size=>10

			font("Helvetica", :size => 10)

			move_down 10
			text "I certify that the above entries are true and correct", :align=>:center

			text "Prepared by:"

			move_down 20
			
			signature = make_cell(:content=>"Signature")
			agm = make_cell(:content=>"AGM/Superintendent")
			seafarer = make_cell(:content=>"Signature of Seafarer")

			bounding_box([0,cursor],:width => 180) do
				text "(SGD) JOHN B. DELA ROSA", :align=>:center
			end
			data = [
				[signature,make_cell(:content=>"\s", :border_width=>0),agm,make_cell(:content=>"\s", :border_width=>0),seafarer]
			]
			table data, :column_widths=>[180,45,150,45,150], :width=>570, :cell_style=>{:align=>:center,:borders=>[:top]}

			move_down 20
			bounding_box([0,cursor],:width => 180) do
				text "(SGD) CAPT. VICMAR C. CALIBJO", :align=>:center
			end

			fleet = make_cell(:content=>"Fleet Manager")
			general = make_cell(:content=>"General Manager")
			principal = make_cell(:content=>"Principal's Representative")
			data = [
				[fleet,make_cell(:content=>"\s", :border_width=>0),general,make_cell(:content=>"\s", :border_width=>0),principal]
			]
			table data, :column_widths=>[180,45,150,45,150], :width=>570, :cell_style=>{:align=>:center,:borders=>[:top]}
    end #end prawn
  end
end #end class
