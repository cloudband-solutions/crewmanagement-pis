ActiveAdmin.register VesselType do

  menu parent: "Vessel Files"

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    column :name
    column :description
    actions
  end

  filter :name
  filter :code

  form do |f|
    f.inputs "Vessel Type" do
      f.input :name
      f.input :description
    end
    f.actions
  end

end


