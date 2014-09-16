class MisugaReportPdf < Prawn::Document
  def initialize(crew, view)
    super()

    Prawn::Document.generate("app/pdfs/MisugaReport.pdf") do
    	pic_url = crew.picture.path(:standard).nil? ? "#{Rails.root}/app/assets/images/pictures/missing_standard.png" : crew.picture.path(:standard)
    	image pic_url, :width=>80, :height=>80, :at=>[0,720]
    	text "MISUGA KAIUN CO., LTD.", :align=>:center, :size=>12, :style=>:bold_italic
	    text "1692-2 Nakanosho-cho, Shikokuchuo-shi", :align=>:center, :size=>10
	    text "Ehime 799-0422, Japan", :align=>:center, :size=>10
	    move_down 10
	    text "B I O - D A T A", :align=>:center, :size=>18, :style=>:bold_italic

	  	bounding_box([450, 720], :width => 100, :height => 90) do
	    	data = [
					[{:content => "VERIFIED BY CMD", :colspan => 2}],
					[make_cell(:content=>"GM", :height=>30), make_cell(:content=>"MANAGER", :height=>30)]
				]
	    	table data, :position=>:right, :width=>150, :cell_style=>{:size=>8,:align=>:center}
	  	end

	  	#First Row of Information
	  	code_num = make_cell(:content => "<b>Code No.:</b>", :border_width => 0)
	  	code_num_value = make_cell(:content => crew.code_number, :border_width => 1 , :borders => [:bottom])
	  	rank = make_cell(:content => "<b>Rank:</b>", :border_width => 0)
	  	rank_value = make_cell(:content => crew.rank.name, :border_width => 1 , :borders => [:bottom])
	  	date_employed = make_cell(:content => "<b>Date Employed:</b>", :border_width => 0)
	  	date_employed_value = make_cell(:content => crew.date_employed.to_s, :border_width => 1 , :borders => [:bottom])
	  	vessel = make_cell(:content => "<b>Vessel:</b>", :border_width => 0)
	  	vessel_value = make_cell(:content => crew.vessel.name, :border_width => 1 , :borders => [:bottom])
	  	data = [   
	  		[code_num, code_num_value , rank ,rank_value,date_employed, date_employed_value, vessel ,vessel_value]
	  	]
	  	table data, :column_widths=>[ 45,100,23,100,60,100,30,55 ],:position=>:left, :cell_style=>{:inline_format => true, :size=>7,:align=>:left, :padding=>[2,0,2,0]}

	  	move_down 5

	  	#Second Row
	  	name = make_cell(:content => "<b>Name:</b>", :border_width => 0)
	  	fname = make_cell(:content => "<i>(Given Name)</i>", :border_width => 0)
	  	mname = make_cell(:content => "<i>(Middle Name)</i>", :border_width => 0)
	  	lname = make_cell(:content => "<i>(Last Name)</i>", :border_width => 0)
	  	blank = make_cell(:content => " ", :border_width => 0)
	  	fname_value = make_cell(:content => crew.firstname, :border_width => 1 , :borders => [:bottom])
	  	mname_value = make_cell(:content => crew.middlename, :border_width => 1 , :borders => [:bottom])
	  	lname_value = make_cell(:content => crew.lastname, :border_width => 1 , :borders => [:bottom])
	  	data = [
	  		[name, fname_value, mname_value,lname_value],
	  		[blank,fname,mname,lname]
	  	]
	  	table data, :column_widths => [45, 154, 154, 160], :position=>:left, :cell_style=>{:inline_format => true, :size=>7,:align=>:left, :padding=>[2,0,2,0]}

	  	move_down 5

	  	#Third Row
	  	address = make_cell(:content => "<b>Address:</b>", :border_width => 0)
	  	telephone = make_cell(:content => "<b>Telephone:</b>", :border_width => 0)
	  	address_value = make_cell(:content => crew.address, :border_width => 1 , :borders => [:bottom])
	  	telephone_value = make_cell(:content => crew.telephone_no, :border_width => 1 , :borders => [:bottom])
	  	data = [
	  		[address, address_value, telephone, telephone_value]
	  	]
	  	table data, :column_widths => [45, 300, 45, 122], :position=>:left, :cell_style=>{:inline_format => true, :size=>7,:align=>:left, :padding=>[2,0,2,0]}

	  	move_down 5

	  	birthdate = make_cell(:content => "<b>Birthdate:</b>", :border_width => 0)
	  	birthplace = make_cell(:content => "<b>Birthplace:</b>", :border_width => 0)
	  	age_text = make_cell(:content => "<b>Age:</b>", :border_width => 0)
	  	nationality = make_cell(:content => "<b>Nationality:</b>", :border_width => 0)

	  	age = Date.today.year - crew.birthday.year 
    	age -= 1 if crew.birthday > Date.today.years_ago( age )

	  	birthdate_value = make_cell(:content => crew.birthday.to_s, :border_width => 1 , :borders => [:bottom])
	  	birthplace_value = make_cell(:content => crew.birthplace, :border_width => 1 , :borders => [:bottom])
	  	age_value = make_cell(:content => age.to_s, :border_width => 1 , :borders => [:bottom])
	  	nationality_value = make_cell(:content => crew.nationality, :border_width => 1 , :borders => [:bottom])
	  	data=[
	  		[birthdate, birthdate_value, age_text, age_value, birthplace, birthplace_value, nationality, nationality_value]
	  	]
	  	table data, :column_widths=>[45,40,25,25,40,190,45,100], :position=>:left, :cell_style=>{:inline_format => true, :size=>7,:align=>:left, :padding=>[2,0,2,0]}
	  	
	  	move_down 5

	  	#Fourth Row
	  	height = make_cell(:content => "<b>Height(cm):</b>", :border_width => 0)
	  	weight = make_cell(:content => "<b>Weight(kg):</b>", :border_width => 0)
	  	shoe_size = make_cell(:content => "<b>Shoe Size:</b>", :border_width => 0)
	  	status = make_cell(:content => "<b>Civil Status:</b>", :border_width => 0)
	  	height_value = make_cell(:content => crew.height.to_s, :border_width => 1 , :borders => [:bottom])
	  	weight_value = make_cell(:content => crew.weight.to_s, :border_width => 1 , :borders => [:bottom])
	  	shoe_size_value = make_cell(:content => crew.shoe_size.to_s, :border_width => 1 , :borders => [:bottom])
	  	status_value = make_cell(:content => crew.civil_status, :border_width => 1 , :borders => [:bottom])
	  	data=[
	  		[height, height_value, weight, weight_value, shoe_size, shoe_size_value, status, status_value]
	  	]
	  	table data, :column_widths => [45,95,45,95,45,95,45,47], :position=>:left, :cell_style=>{:inline_format => true, :size=>7,:align=>:left, :padding=>[2,0,2,0]}

	  	move_down 5

	  	#Fifth Row
	  	relative_name = make_cell(:content => "<b>Name of Wife or Nearest Relative:</b>", :border_width => 0)
	  	relative_rel = make_cell(:content => "<b>Relation:</b>", :border_width => 0)
	  	relative_name_value = make_cell(:content => crew.nearest_relative_name, :border_width => 1 , :borders => [:bottom])
	  	relative_rel_value = make_cell(:content => crew.nearest_relative_relationship, :border_width => 1 , :borders => [:bottom])
	  	data =[
	  		[relative_name, relative_name_value, relative_rel, relative_rel_value]
	  	]
	  	table data, :column_widths => [120,250,40,103],:position=>:left, :cell_style=>{:inline_format => true, :size=>7,:align=>:left, :padding=>[2,0,2,0]}


	  	move_down 20

	  	text "EDUCATIONAL ATTAINMENT", :font_style=>:bold, :size=>12
	  	data = [
	  		[make_cell(:content => "Year Graduated", :font_style=>:bold), make_cell(:content => "School", :font_style=>:bold), make_cell(:content => "Course", :font_style=>:bold)]
	  	]
	  	index = 1;
	  	crew.educational_attainments.each do |educational_attainment|
	  		data << [educational_attainment.year_graduated, educational_attainment.school, educational_attainment.course_finished]

			end
	  	table data, :position=>:left, :width=>550, :cell_style=>{:size=>7,:align=>:center, :padding=>[1,0,2,0]}

	  	move_down 20

	  	license_type = make_cell(:content => "License Type", :font_style=>:bold)
	  	license_number = make_cell(:content => "License Type", :font_style=>:bold)
	  	date_issued = make_cell(:content => "Date Issued", :font_style=>:bold)
	  	expiry_date = make_cell(:content => "Expiry Date", :font_style=>:bold)
	  	issued_by = make_cell(:content => "Issued By", :font_style=>:bold)
	  	LicenseCategory.all.each do |license|
	  		data = [
	  			[license_type, license_number, date_issued, expiry_date, issued_by]
	  		]
	  		text "#{license.name}", :font_style=>:bold, :size=>12
	  		license_cat = LicenseCategory.where(:name=>"#{license.name}")
	      licenses = []
	      if license_cat!=nil
	        licenses = crew.licenses.where(:license_category_id=>license_cat[0].id)
	      end
		  	licenses.each do |license|
		  		data << [license.license_type.to_s, license.license_number.to_s, license.date_issued.to_s, license.expiry_date.to_s, license.training_center.to_s]
		  	end
		  	table data, :position=>:left, :width=>550, :cell_style=>{:size=>7,:align=>:center, :padding=>[1,0,3,0], :valign=>:center}
		  	move_down 20
	  	end

	  	text "ENGLISH ABILITY", :font_style=>:bold, :size=>12
	  	colspan = make_cell(:content => " ", :colspan => 5);
	  	data = [
	  		[' ',colspan],
	  		['Read and Write','5 Excellent','4 Good','3 Acceptable',' 2 Poor','1 Unsuitable'],
	  		['Speak and Listen','5 Excellent','4 Good','3 Acceptable',' 2 Poor','1 Unsuitable']
	  	]
	  	table data, :position=>:left, :width=>550, :cell_style=>{:size=>7,:align=>:center, :padding=>[1,0,2,0]}

	  	move_down 20
	  	text "EXPERIENCE AND UNDERSTANDING OF ISM", :font_style=>:bold, :size=>12
	  	data =[
	  		['Experience','1 Yes','2 No',make_cell(:content=>'',:colspan=>3)],
	  		['Evaluation','5 Excellent','4 Good','3 Acceptable',' 2 Poor','1 Unsuitable']
	  	]
	  	table data, :position=>:left, :width=>550, :cell_style=>{:size=>7,:align=>:center, :padding=>[1,0,2,0]}

	  	move_down 20
	  	text "SEAMAN'S HISTORY (WITHIN THE LAST TEN YEARS)", :font_style=>:bold, :size=>12
	  	text "<b>Note:</b>", :inline_format=>:true, :size=>8
	  	text "1) Indicated whether vessel is M/V (Motor Vessel), S/S or S/T(Steam Turbine) etc.", :size=>8
			text "2) Under TYPE Indicate whether Bulk, Log, VLCC, Chemical, LPG, etc.", :size=>8
			text "3) For Engine Officers and Ratings Indicate Engine Type and KW", :size=>8
			move_down 5
			ships_name = make_cell(:content=>"Ship's Name / Flag", :font_style=>:bold, :height=>30)
			vessel_type = make_cell(:content=>"Vessel Type / Rank", :font_style=>:bold, :height=>30)
			gross_tonnage = make_cell(:content=>"Gross Tonnage / KW Engine Type", :font_style=>:bold, :height=>30)
			manning_agent = make_cell(:content=>"Manning Agent", :font_style=>:bold, :height=>30)
			sign_on_off = make_cell(:content=>"Sign On\nSign Off", :font_style=>:bold, :height=>30)
			reason = make_cell(:content=>"Reason / Sign Off Period", :font_style=>:bold, :height=>30)

			data =[
				[ships_name, vessel_type, gross_tonnage, manning_agent, sign_on_off, reason]
			]

			crew.employment_records.each do |employment|
				#raise employment.vessel.inspect
				ship_name = "#{employment.vessel.name.upcase} / #{employment.vessel.flag.name.upcase}"
				data << [ship_name,"#{employment.vessel.to_s} / #{employment.rank.name}", "#{employment.vessel.grt} GT / #{employment.vessel.engine_model}", employment.manning_agent.to_s, employment.sign_on.to_s+ "\n" +employment.sign_off.to_s ,employment.reason_for_disembarkation.to_s]
			end
			table data, :column_widths => [150,75,100,75,75,75], :position=>:left, :width=>550, :cell_style=>{:size=>7,:align=>:center, :padding=>[1,0,2,0], :valign=>:center, :height=>25}

			move_down 5

			rank = make_cell(:content => "<b>Rank:</b>", :border_width => 0)
			name = make_cell(:content => "<b>Name:</b>", :border_width => 0)
			rank_value = make_cell(:content => crew.rank.name, :border_width => 1 , :borders => [:bottom])
			name_value = make_cell(:content => crew.to_s, :border_width => 1 , :borders => [:bottom])
			data = [
				[rank, rank_value, name, name_value]
			]
			table data, :position=>:left, :cell_style=>{:inline_format => true, :size=>7,:align=>:left, :padding=>[2,0,2,0]}


    end

  end
end
