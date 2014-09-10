ActiveAdmin.register LicenseCategory do
  menu parent: "Crew Files"

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    column :name
    column :code
    actions
  end

  filter :name
  filter :code

  form do |f|
    f.inputs "License Category" do
      f.input :name
      f.input :code
      f.input :priority
    end
    f.actions
  end

    show do |ad|
    attributes_table do 
      row :name
      row :code
      row :priority
    end
  end 

end

