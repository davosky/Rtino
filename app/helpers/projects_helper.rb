module ProjectsHelper
  def start_date?(project)
    l(project.start_date, format: '%A %d %B %Y') if project.start_date.present?
  end

  def end_date?(project)
    l(project.end_date, format: '%A %d %B %Y') if project.end_date.present?
  end

  def location?(project)
    project.location.name if project.location_id.present?
  end

  def structure?(project)
    project.structure.name if project.structure_id.present?
  end

  def office?(project)
    project.office.name if project.office_id != nil
  end

  def project_status?(project)
    project.project_status.name if project.project_status_id != nil
  end

  def project_typology?(project)
    project.project_typology.name if project.project_typology_id != nil
  end
end
