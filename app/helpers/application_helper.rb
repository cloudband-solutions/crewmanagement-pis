module ApplicationHelper
  def advanced_search_highlight_employment_record(er, p)
    result = ""

    if !p[:rank].blank?
      if er.rank_id == p[:rank].to_i
        result = "highlight"
      end
    end

    if !p[:principal].blank?
      if er.principal_id == p[:principal].to_i
        result = "highlight"
      end
    end

    if !p[:vessel].blank?
      if er.vessel_id == p[:vessel].to_i
        result = "highlight"
      end
    end

    result
  end
end
