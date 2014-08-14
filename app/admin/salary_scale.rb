ActiveAdmin.register SalaryScale do
  menu parent: "Vessel Files"

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
  filter :basic_pay
  filter :seniority_allowance
  filter :command_allowance
  filter :supervisory_allowance
  filter :guaranteed_overtime
  filter :fixed_overtime
  filter :subsistence_allowance
  filter :leave_pay
  filter :good_performance_bonus

  form do |f|
    f.inputs "Salary Scale" do
      f.input :name
      f.input :basic_pay
      f.input :seniority_allowance
      f.input :command_allowance
      f.input :supervisory_allowance
      f.input :guaranteed_overtime
      f.input :fixed_overtime
      f.input :subsistence_allowance
      f.input :leave_pay
      f.input :good_performance_bonus
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :name
      row :basic_pay
      row :seniority_allowance
      row :command_allowance
      row :supervisory_allowance
      row :guaranteed_overtime
      row :fixed_overtime
      row :subsistence_allowance
      row :leave_pay
      row :good_performance_bonus
      
    end
  end

end
