def done_undone(my_list, filename, status, cmd)
  display_list(my_list)
  if my_list.empty?
    puts "we can not update the list, There is no task in the list."
  else
    while cmd
      puts "Enter the number of the to-do that you want to update:"
      number_to_update = gets.chomp.to_i
      if number_to_update > my_list.length || number_to_update < 0
        puts "Try again, the number of the to-dos you entered doesn't exist."
      elsif number_to_update == 0
        puts "Please enter a valid number."
      else
        puts number_to_update
        my_list[number_to_update - 1]['status'] = status
        File.open(filename, 'w') do |f|
          f.write(JSON.pretty_generate(my_list))
        end
        puts "The todo '#{my_list[number_to_update - 1]["content"]}' is #{status}."
        break
      end
    end
  end
end

def add_date (my_list, cmd, filename)

  display_list(my_list)
  if my_list.empty?
    puts "We can not had any date, There is no task in the list."
  else
    while cmd
      puts 'Enter the number of the to-do you want to add  a due date:'
      chose_task = gets.chomp.to_i
      if chose_task == 0
        puts 'Please enter a valid number of a to do.'
      elsif chose_task > my_list.length || chose_task < 0
        puts "Try again, the number of the to-dos you entered doesn't exist"
      else
        puts 'what is the date you want to add? (YYYY-MM-DD)'
        chosen_date = gets.chomp.to_s.strip
        puts chosen_date
        if chosen_date == 0
          puts 'Please enter a valid date.'
        else
          if chosen_date.match(/^(\d{2})-(\d{2})-(\d{4})$/)
            puts 'Error: Invalid date format. Please use YYYY-MM-DD, not DD-MM-YYYY.'
          else
            begin
              test = Date.strptime(chosen_date, '%Y-%m-%d')
              my_list[chose_task - 1]['due_date'] = "#{test}"
              File.open(filename, 'w') do |f|
                f.write(JSON.pretty_generate(my_list))
              end
              puts "Due date added successfully."
              break
            rescue ArgumentError
              puts 'Error: Invalid date format. Please use YYYY-MM-DD.'
            end
          end
        end
      end
    end
  end
end