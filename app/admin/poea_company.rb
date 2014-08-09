ActiveAdmin.register PoeaCompany do

  menu parent: "Vessel Files"

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    column :name
    column :num_vessels
    actions
  end

  filter :name

  form do |f|
    f.inputs "POEA Company" do
      f.input :name
      f.input :description
    end
    f.actions
  end

end

