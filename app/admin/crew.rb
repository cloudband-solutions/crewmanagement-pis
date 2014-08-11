ActiveAdmin.register Crew do
  menu parent: "Crew Files"
  controller do
    def permitted_params
      params.permit!
    end
  end

  filter :firstname
  filter :lastname
  filter :code_number
  filter :rank
  filter :vessel

  index do
    selectable_column
    column :to_s_list
    column :code_number
    column :rank
    column :vessel
    column :is_archived
    actions
  end

  collection_action :toggle_archived do
  end

  member_action :toggle_archived, method: :put do
    crew = Crew.find(params[:id])
    crew.toggle_archive
    crew.save!
    message = crew.archived ? "Crew #{crew.code_number} is archived" : "Crew #{crew.code_number} is unarchived"
    redirect_to action: :show, notice: message
  end

  action_item only: :toggle_archived do
    link_to "Toggle Archived", toggle_archived_admin_crew(crew), method: :put, data: { confirm: "Are you sure?" }
  end
end
