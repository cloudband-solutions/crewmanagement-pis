ActiveAdmin.register ClassificationSociety do

  menu parent: "Vessel Files"

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
    f.inputs "Classification Society" do
      f.input :name
      f.input :code
      f.input :short_description
    end
    f.actions
  end

   show do |ad|
    attributes_table do
      row :name
      row :code
      row :short_description
    end
  end

end

