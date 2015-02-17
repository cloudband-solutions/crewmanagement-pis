class CrewListBuilderService
  def self.crew_list_by_vessel(vessel_id)
    vessel = Vessel.find(vessel_id)

    result = {}

    crew_list = []

    Crew.all_by_vessel(vessel).each do |crew|
      c = {
        number: crew.code_number,
        name: crew.to_s_list,
        rank: crew.rank.name,
        link: "/crews/#{crew.id}"
      }

      crew_list << c
    end

    result[:crews] = crew_list
    result[:vessel] = vessel.name

    result
  end
end
