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
  filter :rank
  filter :vessel

  index do
    selectable_column
    column :to_s_list
    column :code_number
    column :rank
    column :vessel
    column :is_archived
    actions
  end

  form do |f|
    f.inputs "Details" do
    
      f.input :firstname, label: "First Name"
      f.input :middlename, label: "Middle Name"
      f.input :lastname, label: "Last Name"
      f.input :code_number, label: "Code Number"
      f.input :date_employed, label: "Date Employed"
      f.input :rank, label: "Current Rank"
      f.input :vessel, label: "Vessel Assigned"
      f.input :address, label: "Address"
      f.input :telephone_no, label: "Telephone Number"
      f.input :cellphone_no, label: "Cellphone Number"
      f.input :birthday, label: "Birthday"
      f.input :birthplace, label: "Birth Place"
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
      f.input :nearest_relative_name, label: "Nearest Relative Name"
      f.input :nearest_relative_relationship, label: "Relationship"
      f.input :nearest_relative_address, label: "Relative Address"
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
      row :date_employed
      row :rank
      row :vessel
      row :address
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
      row :nearest_relative_name
      row :nearest_relative_relationship
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




  collection_action :toggle_archived do
  end

  member_action :toggle_archived, method: :put do
    crew = Crew.find(params[:id])
    crew.toggle_archive
    crew.save!
    message = crew.archived ? "Crew #{crew.code_number} is archived" : "Crew #{crew.code_number} is unarchived"
    redirect_to action: :show, notice: message
  end

  action_item only: :toggle_archived do
    link_to "Toggle Archived", toggle_archived_admin_crew(crew), method: :put, data: { confirm: "Are you sure?" }
  end
end
