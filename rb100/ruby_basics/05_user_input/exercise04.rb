# Print Something (Part 2)
# In the previous exercise, you wrote a program that asks the user if they want
# the program to print "something". However, this program recognized any input 
# as valid: if you answered anything but y, it treated it as an n response, and 
# quit without printing anything.
#
# Modify your program so it prints an error message for any inputs that aren't
# y or n, and then asks you to try again. Keep asking for a response until you
# receive a valid y or n response. In addition, your program should 
# allow both Y and N (uppercase) responses; case sensitive input is generally 
# a poor user interface choice. Whenever possible, accept both uppercase and 
# lowercase inputs.
#
# Examples:
# $ ruby something2.rb
# >> Do you want me to print something? (y/n)
# y
# something
#
# $ ruby something2.rb
# >> Do you want me to print something? (y/n)
# help
# >> Invalid input! Please enter y or n
# >> Do you want me to print something? (y/n)
# Y
# something
#
# $ ruby something2.rb
# >> Do you want me to print something? (y/n)
# N
#
# $ ruby something2.rb
# >> Do you want me to print something? (y/n)
# NO
# >> Invalid input! Please enter y or n
# >> Do you want me to print something? (y/n)
# n

loop do
  puts '>> Do you want me to print something? (y/n)'
  response = gets.chomp

  case response.downcase
  when 'y'
    puts 'something'
    break

  when 'n'
    break

  else
    puts '>> Invalid input! Please enter y or n'
  end
end

# LS Answer
choice = nil
loop do
  puts '>> Do you want me to print something? (y/n)'
  choice = gets.chomp.downcase
  break if %w(y n).include?(choice)
  puts '>> Invalid input! Please enter y or n'
end
puts 'something' if choice == 'y'
