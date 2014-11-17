class SearchService
  def self.advanced_search(query)
    crews = Crew.active

    if !query[:name].blank?
      query[:name].split(" ").each do |n|
        crews = crews.where("crews.firstname LIKE :q OR crews.middlename LIKE :q OR crews.lastname LIKE :q", q: "%#{n}%")
      end
    end

    if !query[:vessel].blank?
      crews = crews.where("crews.vessel_id = ?", query[:vessel])
    end

    if !query[:rank].blank?
      crews = crews.where("crews.rank_id = ?", query[:rank])
    end

    crews
  end
end
