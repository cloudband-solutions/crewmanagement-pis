ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :user_type

  menu parent: "User Management"
  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :user_type
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :user_type, as: :select, collection: User::USER_TYPES

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :user_type, as: :select, collection: User::USER_TYPES
      f.input :password_confirmation
    end
    f.actions
  end

end

