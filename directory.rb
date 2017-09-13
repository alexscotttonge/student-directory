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
  # get the full name
  name = gets.chomp

  # enter hobby
  puts "Please enter a hobby"
  hobby = gets.chomp

  # enter date of birth
  puts "What is the students date of birth? (dd/mm/yy)"
  dob = gets.chomp

  # while name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {
      name: name,
      cohort: :november,
      hobby: hobby,
      dob: dob
    }

    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please enter another name, hobby and date of birth. Press enter three times to finish."
    name = gets.chomp
    hobby = gets.chomp
    dob = gets.chomp

  end
  # return array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
  while i < students.length do
      puts "#{students[i][:name]} (#{students[i][:cohort]} cohort), hobby: #{students[i][:hobby]}, D.O.B: #{students[i][:dob]}"
      i += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
