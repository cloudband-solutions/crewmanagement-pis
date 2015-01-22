class SearchService
  def self.advanced_search(query)
    crews = Crew.active

    if !query[:name].blank? && !crews.blank?
      query[:name].split(" ").each do |n|
        crews = crews.where("crews.firstname LIKE :q OR crews.middlename LIKE :q OR crews.lastname LIKE :q OR crews.code_number LIKE :q", q: "%#{n}%")
      end
    end

    if !query[:status].blank? && !crews.blank?
      crews = crews.where("crews.status = ?", query[:status])
    end

    if !query[:school].blank? && !crews.blank?
      crews = crews.joins(:educational_attainments).where("educational_attainments.school = ?", query[:school])
    end

    if !query[:license_type].blank? && !crews.blank?
      crews = crews.joins(:licenses).where("licenses.license_type_id = ?", query[:license_type])
    end

    if !query[:vessel].blank? && !crews.blank?
      crews = crews.where("crews.id IN (?)", EmploymentRecord.where(vessel_id: query[:vessel]).pluck(:crew_id).uniq)
    end

    if !query[:rank].blank? && !crews.blank?
      crews = crews.where("crews.id IN (?)", EmploymentRecord.where(rank_id: query[:rank]).pluck(:crew_id).uniq)
    end

    if !query[:principal].blank? && !crews.blank?
      crews = crews.where("crews.id IN (?)", EmploymentRecord.where(principal_id: query[:principal]).pluck(:crew_id).uniq)
    end

    crews
  end
end
