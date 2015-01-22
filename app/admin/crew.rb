ActiveAdmin.register Crew do
  menu parent: "Crew Files"

  controller do
    def permitted_params
      params.permit!
    end
  end

  filter :firstname
  filter :lastname
  filter :code_number
  filter :status, as: :select, collection: Crew::STATUSES
  filter :rank
  filter :vessel

  index do
    selectable_column
    column :name do |crew|
      "#{crew.to_s_list} (#{crew.code_number})"
    end
    column :status
    column :token do |crew|
      crew.crew_token
    end
    column :rank
    column :vessel
    column :is_archived
    actions defaults: true do |crew|
      link_to "Toggle Archive", toggle_archived_admin_crew_path(crew), method: :put, data: { confirm: "Are you sure?" }
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :firstname, label: "First Name"
      f.input :middlename, label: "Middle Name"
      f.input :lastname, label: "Last Name"
      f.input :code_number, label: "Code Number"
      f.input :status
      f.input :date_employed, label: "Date Employed"
      f.input :rank, label: "Current Rank"
      f.input :vessel, label: "Vessel Assigned"
      f.input :address, label: "Address"
      f.input :city_address, label: "City Address"
      f.input :provincial_address, label: "Provincial Address"
      f.input :zip_code, label: "Zipcode"
      f.input :telephone_no, label: "Telephone Number"
      f.input :cellphone_no, label: "Cellphone Number"
      f.input :birthday, label: "Birthday"
      f.input :birthplace, label: "Birth Place"
      f.input :blood_type, :label => "Blood Type", :as => :select, :collection => ["A","B","AB", "O"]
      f.input :blood_pressure, label: "Blood Pressure"
      f.input :nationality, label: "Nationality"
      f.input :civil_status, label: "Civil Status"
      f.input :height, label: "Height"
      f.input :weight, label: "Weight"
      f.input :eye_color, label: "Eye Color"
      f.input :distinguishing_marks, label: "Distinguishing Marks"
      f.input :cloth_size, :label => "Cloth Size", :as => :select, :collection => ["XS", "S", "M", "L", "XL"]
      f.input :shoe_size, label: "Shoe Size"
      f.input :sss_no, label: "SSS Number"
      f.input :tin_no, label: "TIN Number"
      f.input :pagibig_number, label: "PAG-IBIG Number"
      f.input :philhealth_number, label: "Philhealth Number"
      f.input :father_name, label: "Father's Name"
      f.input :mother_maiden_name, label: "Mother's Maiden Name"
      f.input :father_name, label: "Father's Name"
      f.input :mother_maiden_name, label: "Mother's Maiden Name"
      f.input :spouse_name, label: "Spouse's Name"
      f.input :number_of_children, label: "Number of Children"
      f.input :is_smoker, label: "Are you a smoker?"
      f.input :nearest_relative_name, label: "Nearest Relative Name"
      f.input :nearest_relative_relationship, label: "Relationship"
      f.input :nearest_relative_address, label: "Relative Address"
      
      f.has_many :educational_attainments  do |ff|
       ff.input :year_graduated, label: "Year Graduated"
       ff.input :school, label: "School"
       ff.input :course_finished, label: "Course Finished"
      end

      f.has_many :licenses do |ff|
        ff.input :license_number, label: "License Number"
        ff.input :license_type, label: "License Type"
        ff.input :license_category, label: "License Category"
        ff.input :rank, label: "Rank"
        ff.input :date_issued, label: "Date Issued", as: :datepicker
        ff.input :expiry_date, label: "Expiry Date", as: :datepicker
        ff.input :attachment, label: "Attachment"
      end
      f.has_many :certificates do |ff|
        ff.input :certificate_number, label: "Certificate Number"
        ff.input :certificate_type, label: "Certificate Type"
        ff.input :certificate_category, label: "Certificate Category"
        ff.input :date_issued, label: "Date Issued", as: :datepicker
        ff.input :expiry_date, label: "Expiry Date", as: :datepicker
        ff.input :attachment, label: "Attachment"
      end
      f.has_many :documents do |ff|
        ff.input :document_kind, label: "Document Kind"
        ff.input :doc_number, label: "Document Number"
        ff.input :issued_at, label: "Issued at", as: :datepicker
        ff.input :expiry_date, label: "Expiry Date", as: :datepicker
        ff.input :issued_by, label: "Issued by"
        ff.input :attachment, label: "Attachment"
      end
      f.has_many :crew_vessel_evaluations do |ff|
        ff.input :vessel, label: "Vessel"
        ff.input :date_of_evaluation, label: "Date of Evaluation", as: :datepicker
        ff.input :attachment, label: "Attachment"
        ff.input :recommendation_letter
        ff.input :training_record
      end
      f.has_many :crew_office_evaluations do |ff|
        ff.input :vessel, label: "Vessel"
        ff.input :date_of_evaluation, label: "Date of Evaluation", as: :datepicker
        ff.input :attachment, label: "Attachment"
      end
      f.has_many :employment_records do |ff|
        ff.input :vessel, label: "Vessel"
        ff.input :manning_agent, label: "Manning Agent"
        ff.input :rank, label: "Rank"
        ff.input :sign_on, label: "Sign on", as: :datepicker
        ff.input :sign_off, label: "Sign off", as: :datepicker
        ff.input :reason_for_disembarkation, label: "Reason of Disembarkation"
      end
    end

    f.inputs "Images" do 
      f.input :picture, label: "2x2 Picture"
      f.input :signature, label: "Signature"
    end
    
    f.actions
  end

  show do |ad|
    attributes_table do
      row :firstname
      row :middlename
      row :lastname
      row :code_number  
      row :crew_token
      row :date_employed
      row :rank
      row :vessel
      row :address
      row :city_address
      row :provincial_address
      row :zip_code
      row :telephone_no
      row :cellphone_no
      row :birthday
      row :birthplace
      row :nationality
      row :civil_status
      row :height
      row :weight
      row :eye_color
      row :distinguishing_marks
      row :cloth_size
      row :shoe_size
      row :sss_no
      row :tin_no
      row :pagibig_number
      row :philhealth_number
      row :father_name
      row :mother_maiden_name
      row :spouse_name
      row :number_of_children
      row :is_smoker
      

    end


    attributes_table do
      row :nearest_relative_name
      row :nearest_relative_relationship
      row :nearest_relative_address
    end

    attributes_table do
      row :picture do
        image_tag ad.picture.url(:standard)
      end
    end

    attributes_table do
      row :signature do
        image_tag ad.signature.url(:standard)
      end
    end

  end

  member_action :toggle_archived, method: :put do
    crew = Crew.find(params[:id])
    crew.toggle_archive!
    message = crew.is_archived ? "Crew #{crew.code_number} is archived" : "Crew #{crew.code_number} is unarchived"
    redirect_to action: :index, notice: message
  end

  action_item only: :toggle_archived do
    link_to "Toggle Archived", toggle_archived_admin_crew(crew), method: :put, data: { confirm: "Are you sure?" }
  end
end
