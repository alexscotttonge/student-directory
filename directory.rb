# let's put all the students in a hash

# students = [
#    {name: "Dr. Hannibal Lecter", cohort: :november},
#    {name: "Darth Vader", cohort: :november},
#    {name: "Nurse Ratched", cohort: :november},
#    {name: "Michael Corleone", cohort: :november},
#    {name: "Alex DeLarge", cohort: :november},
#    {name: "The Wicked Witch of the West", cohort: :november},
#    {name: "Terminator", cohort: :november},
#    {name: "Freddy Krueger", cohort: :november},
#    {name: "The Joker", cohort: :november},
#    {name: "Joffrey Baratheon", cohort: :november},
#    {name: "Norman Bates", cohort: :november},
#  ]


def input_students
  puts 'Please enter the names of the students'
  # create an empty array
  students = []

  # get the full name and add default value
  name = gets.strip
    if name.empty?
      name = 'Sauron'
    end

  # enter cohort and add default value
  puts "Please enter a cohort for #{name}"
  cohort = gets.strip
    if cohort.empty?
      cohort = 'September'
    end
  # while name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {
      name: name,
      cohort: cohort,
    }

    if students.length > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end
    # get another name from the user
    puts "Please enter another name and cohort. Press enter two times to finish."
    name = gets.strip
    cohort = gets.strip


  end
  # return array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
 students.each do |student|
      puts "#{student[:name]}, (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  if students.length > 1
    puts "Overall, we have #{students.count} great students"
  else
    puts "Overall, we have #{students.count} great student"
  end
end

# nothing happens until we call the methods
students = input_students
print(students.sort_by { |value| value[:cohort]})
print_footer(students)
