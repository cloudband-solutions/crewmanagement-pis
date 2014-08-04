ActiveAdmin.register Vessel do

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
  filter :code
  filter :owner
  filter :vessel_type

  form do |f|
    f.inputs "Manning Agent" do
      f.input :name
      f.input :code
      f.input :vessel_type
      f.input :flag
      f.input :horse_power
      f.input :engine_make
      f.input :owner
      f.input :off_numb
    end
    f.actions
  end

end

