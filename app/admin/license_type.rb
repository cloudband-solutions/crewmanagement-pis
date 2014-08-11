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
    end
    f.actions
  end

end

