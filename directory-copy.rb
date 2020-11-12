def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
    
  students = []
    
  name = gets.chomp
  
    
  while !name.empty? do
    if name[0] == 'm' || name[0] == 'M'
      if name.length <= 12
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = gets.chomp
      else
        puts "Please enter the names of the students"
        puts "To finish, just hit return twice"
        name = gets.chomp
      end
    end
  end
  students
end
def print_header    
  puts 'The students of Villains Academy'
  puts '------------'
end
def print(students)
  students.each_with_index do |student, i|
    puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
students = input_students
print_header
print(students)
print_footer(students)