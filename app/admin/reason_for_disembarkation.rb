ActiveAdmin.register ReasonForDisembarkation do

  menu parent: "Crew Files"

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    column :name
    actions
  end

  filter :name

  form do |f|
    f.inputs "Reason for Disembarkation" do
      f.input :name
      f.input :description
    end
    f.actions
  end

  show do |ad|
    attributes_table do 
      row :name
      row :description
    end
  end 

end

