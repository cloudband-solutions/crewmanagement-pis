ActiveAdmin.register Rank do
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
    f.inputs "Rank" do
      f.input :name
      f.input :code
    end
    f.actions
  end

end


