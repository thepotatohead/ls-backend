# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def operation_to_message(op)
  messages = {
    '1' => 'Adding',
    '2' => 'Subtracting',
    '3' => 'Multiplying',
    '4' => 'Dividing'
  }

  messages[op]
end

def valid_language?(input)
  input == '1' || input == '2'
end

lang = ''
loop do
  prompt "Choose a language: 1) English 2) Tagalog"
  lang = gets.chomp

  break if valid_language?(lang)
end

messages =
  case lang
  when '1' then MESSAGES['en']
  when '2' then MESSAGES['tl']
  end

prompt messages['welcome']

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt messages['valid_name']
  else
    break
  end
end

prompt("#{messages['say_hi']} #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt messages['first_number']
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt messages['valid_number']
    end
  end

  number2 = ''
  loop do
    prompt messages['second_number']
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt messages['valid_number']
    end
  end

  operator_prompt = <<-OPERATOR_PROMPT
    1) add
    2) subtract
    3) multiply
    4) divide
  OPERATOR_PROMPT

  prompt messages['choose_operator']
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt messages['valid_operator']
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers..."

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt "#{messages['result']} #{result}"

  prompt messages['calculate_again']
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt messages['goodbye']
