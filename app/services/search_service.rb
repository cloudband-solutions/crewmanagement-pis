class SearchService
  def self.advanced_search(query)
    crews = Crew.active

    if !query[:name].nil?
      crews = crews.where("crews.firstname LIKE :q OR crews.middlename LIKE :q OR crews.lastname", q: "%#{query[:name]}%")
    end

    if !query[:vessel].nil?
      crews = crews.where("crews.vessel_id = ?", query[:vessel])
    end

    crews
  end
end
