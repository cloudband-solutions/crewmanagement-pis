ActiveAdmin.register TransmittalRecord do

    controller do
    	def permitted_params
    		params.permit!
    	end
    end

	filter :status
	filter :destination

	index do
		column :prepared_on
		column :destination
		column :prepared_by
		column :approved_by
		column :noted_by
		column :status

		actions
	end

	form do |f|
		f.inputs "Details" do 
			f.input :vessel
			f.input :prepared_by
			f.input :prepared_by_position
			f.input :approved_by
			f.input :approved_by_position
			f.input :noted_by
			f.input :noted_by_position
			f.input :prepared_on
			f.input :destination
			f.input :date_of_departure
			f.input :prepared_on
			f.has_many :transmittal_record_embarking_crews do |ff|
				ff.input :crew
				ff.input :rank
				ff.input :manning_agent
			end
			f.has_many :transmittal_record_disembarking_crews do |ff|
				ff.input :crew
				ff.input :rank
				ff.input :manning_agent
				ff.input :date_embarked, as: :datepicker
				ff.input :reason_for_disembarkation
			end
			f.has_many :transmittal_record_crew_promotions do |ff|
				ff.input :crew
				ff.input :from_rank
				ff.input :to_rank
			end
		end

		f.actions

	end

	show do |ad|
		attributes_table do 
			row :prepared_by
			row :prepared_by_position
			row :approved_by
			row :approved_by_position
			row :noted_by
			row :noted_by_position
			row :destination
			row :date_of_departure
			row :prepared_on
			row :vessel
			row :status
		end

		div class: 'panel' do 
		 h3 'Embarking Crews'
			div class: 'attributes_table' do
				table do
					tr do
						th do
							'Name'
						end
						th do 
							'Rank'
						end
					end

				ad.transmittal_record_embarking_crews.each do |t|
					tr do
						td do
							t.crew
						end
						td do
							t.rank
						end
					end
				end
				end
			end
		end


		div class: 'panel' do 
		 h3 'Disembarking Crews'
			div class: 'attributes_table' do
				table do
					tr do
						th do
							'Name'
						end
						th do 
							'Rank'
						end
						th do
							'Date Embarked'
						end
						th do
							'Reason of Disembarkation'
						end
					end

				ad.transmittal_record_disembarking_crews.each do |t|
					tr do
						td do
							t.crew
						end
						td do
							t.rank
						end
						td do
							t.date_embarked
						end
						td do
							t.reason_for_disembarkation
						end
					end
				end
				end
			end
		end

		div class: 'panel' do
			h3 'Crew for Promortion'
				div class: 'attributes_table' do
					table do 
						tr do
							th do 
								'Name'
							end
							th do 
								'From'
							end
							th do
								'To'
							end
						end

						ad.transmittal_record_crew_promotions.each do |t|
							tr do
								td do
									t.crew
								end
								td do
									t.from_rank
								end
								td do
									t.to_rank
								end
							end
						end
					end

				end
		end

	end
end