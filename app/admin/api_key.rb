ActiveAdmin.register ApiKey do
  controller do
    def permitted_params
      params.permit!
    end
  end

  filter :access_token

  index do
    selectable_column
    column :access_token
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :access_token
    end

    f.actions
  end
end
