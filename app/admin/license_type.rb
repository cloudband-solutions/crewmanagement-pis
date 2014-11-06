ActiveAdmin.register LicenseType do
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
    f.inputs "License Type" do
      f.input :name
      f.input :code
      f.input :priority
      f.input :short_description
      f.input :license_category
    end
    f.actions
  end

    show do |ad|
    attributes_table do 
      row :name
      row :code
      row :priority
      row :short_description
      row :license_category
    end
  end 

end

