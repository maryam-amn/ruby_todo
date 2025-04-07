def add_a_task(my_list, cmd, filename)
  while cmd
    puts "Enter your todo (enter 'stop' when you finished):"
    task = gets.chomp.strip
    if task.empty?
      puts "Please enter a valid todo."
    elsif task == "stop"
      break
    else
      my_list.push(task)
    end
  end
  number = 1
  puts "Your todo list: "
  my_list.each do |chore|
    puts "#{number}. #{chore}"
    number += 1
  end
  File.open(filename, 'w') do |f|
    f.write(JSON.pretty_generate(my_list))
  end
end
def delete (my_list , cmd, filename)
  if my_list.empty?
    puts " We can not delete from your list. There is no task in it. "
  else
    index = 1
    puts "Your todo list: "
    my_list.each do |chore|
      puts "#{index}. #{chore}"
      index += 1
    end
    while cmd
      puts "Enter the number of the todo you want to delete: "
      chose_number_to_delete = gets.chomp.strip.to_i
      if chose_number_to_delete > my_list.length || chose_number_to_delete < 0
        puts "Try again, the number of the todos that you enter doesn't exist."
      elsif chose_number_to_delete == 0
        puts "Please enter a valid number."
      else
        puts "the todo '#{my_list[chose_number_to_delete - 1]}'is deleted from the list."
        my_list.delete(my_list[chose_number_to_delete - 1])
        File.open(filename, 'w') do |f|
          f.write(JSON.pretty_generate(my_list))
        end
        break
      end
    end
  end
end
