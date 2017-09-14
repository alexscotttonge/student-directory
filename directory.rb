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

def interactive_menu

  students = []

  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items

    # 2. read the input and save it into a variable
    selection = gets.chomp

    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end

end

def input_students

  # create an empty array
  students = []

  puts 'Please enter the names of the students'

  # get the full name
  name = gets.chomp

  # force user to input name so empty list won't be created
  while true do
    if name.empty?
      puts "enter name"
      name = gets.chomp
    end
    break if !name.empty?
  end

  # enter cohort
  puts "Please enter a cohort for the student"
  cohort = gets.chomp

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
  if students.length == 1
    puts "Overall, we have #{students.count} great students"
  elsif students.length > 1
    puts "Overall, we have #{students.count} great student"
  else
    # added control flow so an empty list won't be printed when there are no students
    puts "There are no students in the list"
  end
end

# nothing happens until we call the methods
interactive_menu
students = input_students
print(students)
print_footer(students)
