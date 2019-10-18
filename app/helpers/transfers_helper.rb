module TransfersHelper
  def transfer_date?(transfer)
    l(transfer.transfer_date, format: '%A %d %B %Y') if transfer.transfer_date.present?
  end
  def travel_time?(transfer)
    transfer.travel_time if transfer.travel_time.present?
  end
  def transport?(transfer)
    transfer.transport.name if transfer.transport_id.present?
  end
  def printable?(transfer)
    transfer.count.positive?
  end
end
