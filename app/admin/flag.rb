ActiveAdmin.register Flag do

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
    column :num_vessels
    actions
  end

  filter :name
  filter :code

  form do |f|
    f.inputs "Flag" do
      f.input :name
      f.input :code
    end
    f.actions
  end

    show do |ad|
    attributes_table do 
      row :name
      row :code
    end
  end 

end

