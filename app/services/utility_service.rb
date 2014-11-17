class UtilityService
  def self.unique_schools
    EducationalAttainment.where("crew_id IN (?)", Crew.active.pluck(:id)).pluck(:school).uniq
  end
end
