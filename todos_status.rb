def done_undone(my_list, filename, status, cmd )
  display_list(my_list)
  if my_list.empty?
    puts "we can not update the list, There is no task in the list."
  else
    while cmd
    puts "Enter the number of the to-do that you want to update:"
    number_to_update = gets.chomp.to_i
    if number_to_update > my_list.length || number_to_update < 0
      puts "Try again, the number of the to-dos you entered doesn't exist."
    elsif number_to_update ==  0
      puts "Please enter a valid number."
    else
      puts number_to_update
      my_list[number_to_update - 1][1]= status
      File.open(filename, 'w') do |f|
        f.write(JSON.pretty_generate(my_list ))
      end
      puts "the todo '#{my_list[number_to_update - 1][0]}' is #{status}."
      break
    end
    end
    end
end