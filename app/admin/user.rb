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
    column :email
    column :name do |user|
      user
    end
    column :access_token
    column :current_sign_in_at
    column :sign_in_count
    column :user_type
    column :principal
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
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :password
      f.input :password_confirmation
      f.input :user_type, as: :select, collection: User::USER_TYPES
      f.input :principal
    end
    f.actions
  end

end

