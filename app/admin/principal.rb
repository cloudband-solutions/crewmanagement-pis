ActiveAdmin.register Principal do
  
  controller do 
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    column :name
    column :email
    column :address
    column :telephone_number
    column :num_vessels
    actions
  end

  filter :name
  filter :email
  filter :email

  form do |f|
    f.inputs "Principal" do
      f.input :name
      f.input :email
      f.input :address
      f.input :telephone_number
      f.input :fax_number
      f.has_many :principal_contact_people do |ff|
        ff.input :first_name
        ff.input :last_name
        ff.input :email
        ff.input :contact_number
        ff.input :designation
      end
    end
    f.actions
  end
end
