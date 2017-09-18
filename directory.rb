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

@students = []
@file = ''
require 'csv'

def interactive_menu
  loop do
    print_menu
    choose_menu_item(STDIN.gets.chomp)
  end
end

def print_menu
  puts "Please choose from one of the following"
  puts '---------------------'
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the students to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def choose_menu_item(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def add_student_name
  puts "You've chosen to 'Input Students' from the menu, is that right?\nEnter 'no' to return to the menu"
  answer = gets.chomp
  if answer == 'yes'.downcase
    puts 'Great, please enter the names of the students'
  else
    print_menu
  end
  # get the full name
  @name = STDIN.gets.chomp
end

def enter_student_cohort
  # enter cohort month
  puts "Please enter a cohort for the student"
  @cohort = STDIN.gets.chomp
end

def input_students

  add_student_name

  loop do # change while loop to simple loop
    if @name.empty?
      puts "Please enter a name"
      @name = STDIN.gets.chomp
    end
    break if !@name.empty?
  end

  enter_student_cohort

  # while name is not empty, repeat this code
  while !@name.empty? do
    # add the student hash to the array
    add_students_to_array
    count_students

    # get another name from the user
    puts "Please enter another name and cohort. Hit enter twice to get back to the menu"
    @name = STDIN.gets.chomp
    @cohort = STDIN.gets.chomp
  end
  # return array of students
  @students
end

def count_students # added separate method to count students
  if @students.length > 1
   puts "Now we have #{@students.count} students"
  else
   puts "Now we have #{@students.count} student"
  end
end

def add_students_to_array
  @students << {name: @name, cohort: @cohort}
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
 @students.each do |student|
      puts "#{student[:name]}, (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.length == 1
    puts "Overall, we have #{@students.count} great student"
  elsif @students.length > 1
    puts "Overall, we have #{@students.count} great students"
  else
    # added control flow so an empty list won't be printed when there are no students
    puts "There are no students in the list"
  end
end

def save_students
  # open the file for writing
  CSV.open("students.csv", "w") do |csv|
  # iterate over the array of students
    @students.each do |student|
      csv << [student[:name], student[:cohort]] # add each row to the csv
    end
    puts "The students have been successfully saved to the file"
  end # csv is closed automatically when block ends
end

def load_students
  CSV.foreach("students.csv") do |row|
    name, cohort = row # parallel assignment for each line of array
    add_students_to_array
  end # csv is closed automatically when block ends
  puts "The students have been successfully loaded from the file"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

# nothing happens until we call the methods
try_load_students
interactive_menu
