class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type
  # TODO: complete the folowing
  before_create :update_stats
  before_destroy :update_stats2
  before_create :errorl
  private
  def update_stats
    es = self.ticket_type.event.event_stat
    es.attendance = es.attendance+1
    es.tickets_sold = es.tickets_sold+1
    es.save!
    # TODO: complete in order to update event stats
  end
  def update_stats2
    es = self.ticket_type.event.event_stat
    es.attendance = es.attendance-1
    es.tickets_sold = es.tickets_sold-1
    es.save!
    # TODO: complete in order to update event stats
  end
  def errorl
    es = self.ticket_type.event.event_stat
    ev = self.ticket_type.event.event_venue
    if es.attendance+1>ev.capacity
      puts 'Error: The ticket sold surpases the capacity of the Event Venue, this is unethical so we are not allowing this to happen! Be careful'
      throw :abort

  end
end



end