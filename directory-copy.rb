def input_students
  puts "Please enter the names of the students".center(85)
  puts "To finish, just hit return twice".center(85)
    
  students = []
    
  name = gets.chomp
  
  puts 'Enter cohort'.center(85)
  cohort = gets.chomp
  if cohort.empty?
    cohort = :november
  end

  puts 'Please enter student nationality'.center(85)
  nation = gets.chomp
    
  while !name.empty?
    students << {name: name, cohort: cohort.to_sym, nationality: nation}
    if students.count == 1
      puts "Now we have 1 student".center(85)
      puts "Please enter the names of the students".center(85)
      name = gets.chomp
      if !name.empty?
        puts 'Enter cohort'.center(85)
        cohort = gets.chomp  
        if cohort.empty?
          cohort = :november
        end               
        puts 'Please enter student nationality'.center(85)
        nation = gets.chomp
      end               
    else
      puts "Now we have #{students.count} students".center(85)
      puts "Please enter the names of the students".center(85)
      name = gets.chomp
      if !name.empty?
        puts 'Enter cohort'.center(85)
        cohort = gets.chomp 
        if cohort.empty?
          cohort = :november
        end               
        puts 'Please enter student nationality'.center(85)
        nation = gets.chomp
      end                
    end
  end
  students
end

def print_header    
  puts 'The students of Villains Academy'.center(85)
  puts '------------'.center(85)
end

def print_students(students)
  students.each.with_index do |student, i|
    puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort) (#{student[:nationality]})".center(85)
  end
end

def print_footer(names)
  unless names.count < 1
    if names.count == 1
      puts "Overall, we have 1 great student".center(85)
    else  
      puts "Overall, we have #{names.count} great students".center(85)
    end
  end
end


students = input_students
print_header
print_students(students)
print_footer(students)


# def input_students
#   puts "Please enter the names of the students"
#   puts "To finish, just hit return twice"
    
#   students = []
    
#   name = gets.chomp
  
    
#   while !name.empty? do
#     if name[0] == 'm' || name[0] == 'M'
#       if name.length <= 12
#         students << {name: name, cohort: :november}
#         puts "Now we have #{students.count} students"
#         name = gets.chomp
#       else
#         puts "Please enter the names of the students"
#         puts "To finish, just hit return twice"
#         name = gets.chomp
#       end
#     end
#   end
#   students
# end
# def print_header    
#   puts 'The students of Villains Academy'
#   puts '------------'
# end
# def print(students)
#   students.each_with_index do |student, i|
#     puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
#   end
# end
# def print_footer(names)
#   puts "Overall, we have #{names.count} great students"
# end
# students = input_students
# print_header
# print(students)
# print_footer(students)