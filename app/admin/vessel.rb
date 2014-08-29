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
    column :scale
    actions
  end

  filter :name
  filter :code
  filter :owner
  filter :classification_society
  filter :principal
  filter :flag
  filter :engine_make
  filter :engine_model
  filter :poea_company
  filter :vessel_type
  filter :email, presence: true, uniqueness: true
  filter :inmarsat_id_number, presence: true, uniqueness: true
  filter :tel_number, presence: true, uniqueness: true
  filter :fax_number, presence: true, uniqueness: true
  filter :imo_number
  filter :callsign
  filter :grt
  filter :nrt
  filter :dwt
  filter :loa
  filter :breadth
  filter :depth
  filter :type_of_lifeboat, as: :select, collection: Vessel::LIFEBOAT_TYPES

  form do |f|
    f.inputs "Vessel Record" do
      f.input :name
      f.input :code
      f.input :principal
      f.input :classification_society
      f.input :flag
      f.input :poea_company
      f.input :salary_scale
      f.input :vessel_type
      f.input :engine_make
      f.input :engine_model
      f.input :horse_power
      f.input :owner
      f.input :off_numb
      f.input :email, presence: true, uniqueness: true
      f.input :inmarsat_id_number, presence: true, uniqueness: true
      f.input :tel_number, presence: true, uniqueness: true
      f.input :fax_number, presence: true, uniqueness: true
      f.input :imo_number
      f.input :callsign
      f.input :grt
      f.input :nrt
      f.input :dwt
      f.input :loa
      f.input :breadth
      f.input :depth
      f.input :ecdis, label: "ECDIS"
      f.input :type_of_lifeboat, as: :select, collection: Vessel::LIFEBOAT_TYPES
    end
    f.actions
  end

  show do |ad|
    attributes_table do 
      row :name
      row :code
      row :principal
      row :classification_society
      row :flag
      row :poea_company
      row :salary_scale
      row :vessel_type
      row :engine_make
      row :engine_model
      row :horse_power
      row :owner
      row :off_numb
      row :email
      row :inmarsat_id_number
      row :tel_number
      row :fax_number
      row :imo_number
      row :callsign
      row :grt
      row :nrt
      row :dwt
      row :loa 
      row :breadth
      row :depth
      row :ecdis
      row :type_of_lifeboat
    end

  end

end

