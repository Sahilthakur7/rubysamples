puts "Airplane Seating Algorithm"

class Section
    attr_reader :columns
    attr_reader :rows
    attr_accessor :seating

    def initialize(columns,rows)
        @columns = columns.to_i
        @rows = rows.to_i

        @seating = Array.new(@columns) { Array.new(@rows) }
    end
end

class Airplane
    attr_accessor :sections
    attr_accessor :no_of_sections
    attr_reader :no_of_seats

    def initialize(input)
        @no_of_sections = input.length
        @sections = []

        @no_of_sections.times do |i|
            @sections << Section.new(input[i][1],input[i][3]) 
        end

        @no_of_seats = total_seats(input)

    end

    def total_seats(input)
        total = 0

        input.length.times do |i|
            total = total + (input[i][1].to_i * input[i][3].to_i)
        end

        return total
    end
end

def break_into_rows_and_columns(input)
    slice_outer_brackets(input)
    input = split_into_arrays(input)

    return input

end

def slice_outer_brackets(input)
    input.slice!(0)
    input.slice!(input.length - 1)
end

def split_into_arrays(input)
    regex = /(?<=\])/   #using lookbehind in regex to not remove delimeter
    input = input.split(regex) 

    input.each do |el|
        if(el[0] == ',')
            el.slice!(0)
        end
    end

    return input

end

def fill_seats(test_plane)
    fill_isle_seats(test_plane) 
    fill_window_seats(test_plane )
    fill_center_seats(test_plane)

    print_arrangement(test_plane)

end


def fill_isle_seats(test_plane)
    test_plane.sections.each do |section|
        fill_front_aisle(section,test_plane)
    end 
    fill_other_aisles(test_plane)

end

def fill_front_aisle(section,test_plane)
    if(section == test_plane.sections[0])
        if($passenger_no < $passengers)
            section.seating[section.columns - 1][0] = $passenger_no
            increment_passenger_no
        end
    elsif(section == test_plane.sections[-1])
        if($passenger_no < $passengers)
            section.seating[0][0] = $passenger_no
            increment_passenger_no
        end
    else
        if($passenger_no < $passengers)
            section.seating[0][0] = $passenger_no
            increment_passenger_no
        end
        if($passenger_no < $passengers)
            section.seating[section.columns - 1][0] = $passenger_no
            increment_passenger_no
        end
    end
end

def fill_other_aisles(test_plane)
    max_no = max_rows(test_plane)

    for i in 1..max_no - 1
        test_plane.sections.each do |section|
            if(section.rows > i)
                if(section == test_plane.sections[0])
                    if($passenger_no < $passengers)
                        section.seating[section.columns - 1][i] = $passenger_no
                        increment_passenger_no
                    end
                elsif(section == test_plane.sections[-1])
                    if($passenger_no < $passengers)
                        section.seating[0][i] = $passenger_no
                        increment_passenger_no
                    end
                else
                    if($passenger_no < $passengers)
                        section.seating[0][i] = $passenger_no
                        increment_passenger_no
                    end
                    if($passenger_no < $passengers)
                        section.seating[section.columns - 1][i] = $passenger_no
                        increment_passenger_no
                    end
                end
            end
        end
    end
end

def fill_window_seats(test_plane)
    max_no = max_rows(test_plane)

    for i in 0..max_no - 1
        test_plane.sections.each do |section|
            if(section.rows > i)
                if(section == test_plane.sections[0])
                    if($passenger_no < $passengers)
                        section.seating[0][i] = $passenger_no
                        increment_passenger_no
                    end
                elsif(section == test_plane.sections[-1])
                    if($passenger_no < $passengers)
                        section.seating[section.columns - 1][i] = $passenger_no
                        increment_passenger_no
                    end
                end
            end
        end
    end
end

def fill_center_seats(test_plane)
    max_rows = max_rows(test_plane)

    for i in 0..max_rows - 1
        test_plane.sections.each do |section|
            for j in 1..section.columns-2
                if(section.rows > i)
                    if($passenger_no < $passengers)
                        section.seating[j][i] = $passenger_no
                        $passenger_no = $passenger_no + 1
                    end
                end
            end
        end
    end
end

def print_arrangement(test_plane)
    puts "SITTING ARRANGEMENT:"

    test_plane.sections.each do |section|
        for i in 0..section.rows-1
            for j in 0..section.columns-1
                print "#{section.seating[j][i]}\t"
                if(j == section.columns-1)
                    puts "\n"
                end
            end
        end

        puts "NEXT SECTION" unless (section == test_plane.sections[-1]) 
        puts "\t\t"
    end

end

def max_rows(test_plane)
    max = 0
    test_plane.sections.each do |section|
        if(section.rows > max)
            max = section.rows
        end
    end
    return max
end

def max_columns(test_plane)
    max = 0
    test_plane.sections.each do |section|
        if(section.columns > max)
            max = section.columns
        end
    end
    return max-2
end

def increment_passenger_no
    $passenger_no = $passenger_no + 1
end

puts "Enter your rows and columns in the form of a 2D array"

input = gets.chomp

puts "Enter the no of passengers"

$passengers = gets.chomp.to_i + 1

input = break_into_rows_and_columns(input)

test_plane = Airplane.new(input)

if($passengers > test_plane.no_of_seats)
    puts "Passenger input is greater than the seats available"
else
    $passenger_no = 1

    fill_seats(test_plane)
end




