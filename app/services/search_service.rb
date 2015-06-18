class SearchService
  def self.advanced_search(query, crews)

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

    if !query[:license_number].blank? && !crews.blank?
      crews = crews.joins(:licenses, :certificates, :documents).where("licenses.license_number LIKE :q OR certificates.certificate_number LIKE :q OR documents.doc_number LIKE :q", q: "%#{query[:license_number]}%")
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
