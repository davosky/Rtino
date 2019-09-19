module TransfersHelper
  def travel_time?(transfer)
    transfer.travel_time if transfer.travel_time.present?
  end
  def transport?(transfer)
    transfer.transport.name if transfer.transport_id.present?
  end
end
