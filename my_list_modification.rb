
def add_a_task(my_list, cmd, filename)
  while cmd
    puts "Enter your todo (enter 'stop' when you finished):"
    task = gets.chomp.strip
    if task.empty?
      puts "Please enter a valid todo."
    elsif task == "stop"
      break
    else
      task = task, 'undone'
      my_list.push(task)
    end
  end

  display_list(my_list)
  File.open(filename, 'w') do |f|
    f.write(JSON.pretty_generate(my_list, ))
  end
end
def delete_a_task (my_list , cmd, filename)
  if my_list.empty?
    puts " We can not delete from your list. There is no task in it. "
  else
    display_list(my_list)
    while cmd
      puts "Enter the number of the todo you want to delete: "
      chose_number_to_delete = gets.chomp.strip.to_i
      if chose_number_to_delete > my_list.length || chose_number_to_delete < 0
        puts "Try again, the number of the to-dos you entered doesn't exist."
      elsif chose_number_to_delete == 0
        puts "Please enter a valid number."
      else
        puts "the todo '#{my_list[chose_number_to_delete - 1][0]}'is deleted from the list."
        my_list.delete(my_list[chose_number_to_delete - 1])
        File.open(filename, 'w') do |f|
          f.write(JSON.pretty_generate(my_list))
        end
        break
      end
    end
  end
end

def display_list(my_list)
  index = 1
  puts "Your todo list: "
  my_list.each do |chore|
    puts "#{index}. #{chore[0]} #{chore[1]} "
    index += 1
  end
end
