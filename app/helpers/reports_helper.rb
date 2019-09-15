module ReportsHelper
  def location?(report)
    report.location.name if report.location_id.present?
  end

  def structure?(report)
    report.structure.name if report.structure_id.present?
  end

  def category?(assistance)
    assistance.category.name if assistance.category_id != nil
  end

  def office?(assistance)
    assistance.office.name if assistance.office_id != nil
  end
end
