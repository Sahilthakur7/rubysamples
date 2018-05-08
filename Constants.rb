class Ticket
    VENUES = [ "DK", "OC", "Parmar", "Shastri" ]

    def initialize(venue)
        if VENUES.include?(venue)
            @venue = venue
        else
            raise ArgumentError, "Unknown venue #{venue}"
        end
    end
    def venue
    @venue 

    end
end

x = Ticket.new("OC")
puts x.venue

z=Ticket.new("Acads")
puts z.venue


