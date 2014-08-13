class MisugaReportPdf < Prawn::Document
  def initialize(crew, view)
    super()
    text "MISUGA KAIUN CO., LTD.", :align=>:center, :size=>12, :style=>:bold_italic
    text "1692-2 Nakanosho-cho, Shikokuchuo-shi", :align=>:center, :size=>10
    text "Ehime 799-0422, Japan", :align=>:center, :size=>10
    move_down 10
    text "B I O - D A T A", :align=>:center, :size=>18, :style=>:bold_italic

    float do
			bounding_box([400, 720], :width => 100) do
				move_down 3
				text "VERIFIED BY CMD", :align=>:center, :size=>8
				stroke_bounds
			end
		end

		float do
			bounding_box([400, 720], :width => 100, :height=>10) do
				move_down 3
				text "GM", :align=>:center, :size=>8
				stroke_bounds
			end
		end

		float do
			bounding_box([400, 720], :width => 100, :height=>10) do
				move_down 3
				text "VERIFIED BY CMD", :align=>:center, :size=>8
				stroke_bounds
			end
		end

  end
end
