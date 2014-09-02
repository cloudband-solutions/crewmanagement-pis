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
    	table data, :column_widths=>[50, 360, 55, 105], :cell_style=>{:size=>7,:align=>:left, :padding=>[2,0,2,0]}

    	address = make_cell(:content=>"Address:", :border_width => 0)
    	telephone = make_cell(:content=>"Telephone:", :border_width => 0)
    	address_value = make_cell(:content=>crew.address, :border_width => 1, :borders=>[:bottom])
    	telephone_value = make_cell(:content=>crew.telephone_no, :border_width => 1, :borders=>[:bottom])
    	data = [
    		[address, address_value, telephone, telephone_value]
    	]
    	table data, :column_widths=>[50, 360, 55, 105], :cell_style=>{:size=>7,:align=>:left, :padding=>[2,0,2,0]}

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
    	table data, :column_widths=>[50, 100, 50, 60, 50, 100, 55, 105], :cell_style=>{:size=>7,:align=>:left, :padding=>[2,0,2,0]}


    end #end prawn
  end
end #end class