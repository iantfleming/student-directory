def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students  
    when "2"
      print_header
      print_students(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students(students)
  print_footer(students)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
    
  students = []  
  name = gets.chomp
  
  puts 'Enter cohort'
  cohort = gets.chomp
  if cohort.empty?
    cohort = :november
  end

  puts 'Please enter student nationality'
  nation = gets.chomp
    
  while !name.empty?
    students << {name: name, cohort: cohort.to_sym, nationality: nation}
    if students.count == 1
      puts "Now we have 1 student"
      puts "Please enter the names of the students"
      name = gets.chomp
      if !name.empty?
        puts 'Enter cohort'
        cohort = gets.chomp  
        if cohort.empty?
          cohort = :november
        end               
        puts 'Please enter student nationality'
        nation = gets.chomp
      end               
    else
      puts "Now we have #{students.count} students"
      puts "Please enter the names of the students"
      name = gets.chomp
      if !name.empty?
        puts 'Enter cohort'
        cohort = gets.chomp 
        if cohort.empty?
          cohort = :november
        end               
        puts 'Please enter student nationality'
        nation = gets.chomp
      end                
    end
  end
  students
end

def output_by_letter(students)
  students.each do |student| 
    puts 'hello'
    if student[:name][0] == 'm' || student[:name][0] == 'M'
      puts student[:name]
    else
      nil
    end
  end
end

def sort_cohort(students)
  students.sort_by{|student| student[:cohort]}
end


def print_header    
  puts 'The students of Villains Academy'
  puts '------------'
end

def print_students(students)
  students.each_with_index do |student, i|
    puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort) (#{student[:nationality]})"
  end
end

def print_footer(names)
  unless names.count < 1
    if names.count == 1
      puts "Overall, we have 1 great student"
    else  
      puts "Overall, we have #{names.count} great students"
    end
  end
end

interactive_menu
students = input_students
students = sort_cohort(students)
print_header
print_students(students)
print_footer(students)
output_by_letter(students)