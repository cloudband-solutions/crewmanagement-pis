ActiveAdmin.register Vessel do

  menu parent: "Vessel Files"

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    column :name
    column :vessel_type
    column :principal
    column :owner
    column :flag
    actions
  end

  filter :name
  filter :code
  filter :owner
  filter :principal
  filter :flag
  filter :poea_company
  filter :vessel_type

  form do |f|
    f.inputs "Vessel Record" do
      f.input :name
      f.input :principal
      f.input :flag
      f.input :poea_company
      f.input :code
      f.input :vessel_type
      f.input :horse_power
      f.input :engine_make
      f.input :owner
      f.input :off_numb
    end
    f.actions
  end

end

