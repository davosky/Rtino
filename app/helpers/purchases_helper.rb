module PurchasesHelper
  def purchase_date?(purchase)
    l(purchase.purchase_date, format: '%A %d %B %Y') if purchase.purchase_date.present?
  end

  def purchase_approval_date?(purchase)
    l(purchase.purchase_approval_date, format: '%A %d %B %Y') if purchase.purchase_approval_date.present?
  end

  def request_date?(purchase)
    l(purchase.request_date, format: '%A %d %B %Y') if purchase.request_date.present?
  end

  def delivery_date?(purchase)
    l(purchase.delivery_date, format: '%A %d %B %Y') if purchase.delivery_date.present?
  end

  def installation_date?(purchase)
    l(purchase.installation_date, format: '%A %d %B %Y') if purchase.installation_date.present?
  end

  def location?(purchase)
    purchase.location.name if purchase.location_id.present?
  end

  def structure?(purchase)
    purchase.structure.name if purchase.structure_id.present?
  end

  def category?(assistance)
    assistance.category.name if assistance.category_id != nil
  end

  def vendor?(assistance)
    assistance.vendor.name if assistance.vendor_id != nil
  end

  def purchase_typology?(purchase)
    purchase.purchase_typology.name if purchase.purchase_typology_id.present?
  end

  def printable?(purchase)
    purchase.count.positive?
  end
end
