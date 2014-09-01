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
    	code_no_value = make_cell(:content=>'', :border_width => 1, :borders=>[:bottom]);
    	rank_value = make_cell(:content=>crew.rank.name, :border_width => 1, :borders=>[:bottom]);
    	date_value = make_cell(:content=>Date.today.to_s, :border_width => 1, :borders=>[:bottom]);
    	date_employed_value = make_cell(:content=>crew.date_employed.to_s, :border_width => 1, :borders=>[:bottom]);
			data = [
				[code_no, code_no_value, rank, rank_value, date_employed, date_employed_value]
    	]
    	bounding_box([150, 670], :width => 800) do
    		table data, :column_widths=>[30,105,20,105,55,105], :cell_style=>{:size=>7,:align=>:left, :padding=>[2,0,2,0]}
    	end
    #End Header



    end #end prawn
  end
end #end class