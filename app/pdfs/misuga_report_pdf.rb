class MisugaReportPdf < Prawn::Document
  def initialize(crew, view)
    super()

    Prawn::Document.generate("app/pdfs/crew.pdf") do
    	image "#{Prawn::DATADIR}/images/pigs.jpg", :width=>100, :at=>[0,720]
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
	  	rank_value = make_cell(:content => crew.rank_id.to_s, :border_width => 1 , :borders => [:bottom])
	  	date_employed = make_cell(:content => "<b>Date Employed:</b>", :border_width => 0)
	  	date_employed_value = make_cell(:content => crew.date_employed.to_s, :border_width => 1 , :borders => [:bottom])
	  	vessel = make_cell(:content => "<b>Vessel:</b>", :border_width => 0)
	  	vessel_value = make_cell(:content => crew.vessel_id.to_s, :border_width => 1 , :borders => [:bottom])
	  	data = [   
	  		[code_num, code_num_value , rank ,rank_value,date_employed, date_employed_value, vessel ,vessel_value]
	  	]
	  	table data, :column_widths=>[ 45,100,23,100,60,100,30,55 ],:position=>:left, :cell_style=>{:inline_format => true, :size=>7,:align=>:left, :padding=>[2,0,2,0]}

	  	move_down 5

	  	#Second Row
	  	name = make_cell(:content => "<b>Name:</b>", :border_width => 0)
	  	fname = make_cell(:content => "<i>(Given Name:)</i>", :border_width => 0)
	  	mname = make_cell(:content => "<i>(Middle Name:)</i>", :border_width => 0)
	  	lname = make_cell(:content => "<i>(Last Name:)</i>", :border_width => 0)
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

	  	text "1. EDUCATIONAL ATTAINMENT"
	  	data = [
	  		["Year Graduated","School","Course"]
	  	]
	  	table data, :position=>:left, :width=>550, :cell_style=>{:size=>7,:align=>:center, :padding=>[1,0,2,0]}

    end

  end
end
