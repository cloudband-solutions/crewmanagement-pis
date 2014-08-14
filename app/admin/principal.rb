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

  show do |ad|
      attributes_table do
      row :name
      row :email
      row :address
      row :telephone_number
      row :fax_number

    end

    div class: 'panel' do
     h3 'Contact People'
       div class: 'attributes_table' do
        table do
         tr do
            th class: 'sa' do 
              'First Name'
            end
            th class: 'sa' do
              'Last Name'
            end

            th class: 'sa' do
              'Email'
            end

            th class: 'sa' do
              'Contact Number'
            end

            th class: 'sa' do
              'Designation'
            end
         
          end
       principal.principal_contact_people.each do |p|
          tr do
            td class: 'sb' do
              p.first_name
            end

            td class: 'sb' do
              p.last_name
            end

            td class: 'sb' do
              p.email
            end

            td class: 'sb' do
              p.contact_number
            end
           
            td class: 'sb' do
              p.designation
            end
          end
        end
      end
    end
  end


   end


end




