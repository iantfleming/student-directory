@students = []

def push_to_array(name, cohort)
  @students << {name: name, cohort: :november}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    cohort = nil
    push_to_array(name, cohort)
    if @students.count > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end
    name = STDIN.gets.chomp
  end
end

def print_header    
  puts 'The students of Villains Academy'
  puts '------------'
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students"
  else 
    puts"Overall, we have #{@students.count} great student"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end
	
def process(selection)
  case selection
    when "1"
      selection_success("1")
      input_students
    when "2"
      selection_success("2")
      show_students
    when "3"
      selection_success("3")
      save_students
    when "4"
      selection_success("4")
      load_students
    when "9"
      selection_success("9")
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def selection_success(num)
  puts "You have chosen #{num}!"
  if num.to_i == 9
    puts 'You quit'
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student [:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  if @students.count > 1
    puts "#{@students.count} students have been saved to students.csv."
  else 
    puts "#{@students.count} student has been saved to students.csv."
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(', ')
    push_to_array(name, cohort)
  end
  if @students.count > 1
    puts "Loaded #{@students.count} students from students.csv."
  else 
    puts "Loaded #{@students.count} student from students.csv."
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end
    
try_load_students
interactive_menu