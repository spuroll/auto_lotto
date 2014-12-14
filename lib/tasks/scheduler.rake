task :send_emails => :environment do
  require 'open-uri'
  file = open('http://www.megamillions.com/winning-numbers')
  contents = file.read
  contents.to_s
  startparse = contents.index('<div class="ball white">') + 22
  endparse = contents.index('<div class="ball gold">') + 30
  substring = contents[startparse..endparse]
  
  start_array = Array.new
  
  substring.to_enum(:scan,/">/).map do |m,|
      start_array << [$`.size,m]
  end
  
  start_one = start_array[0][0] + 2
  start_two = start_array[1][0] + 2
  start_three = start_array[2][0] + 2
  start_four = start_array[3][0] + 2
  start_five = start_array[4][0] + 2
  start_six = start_array[5][0] + 2
  
  end_array = Array.new
  substring.to_enum(:scan,/<\/div>/).map do |m,|
      end_array << [$`.size,m]
  end
  
  end_one = end_array[0][0] -1
  end_two = end_array[1][0] -1
  end_three = end_array[2][0] -1
  end_four = end_array[3][0] -1
  end_five = end_array[4][0] -1
  end_six = end_array[5][0] -1
  
  num_one = substring[start_one..end_one]
  num_two = substring[start_two..end_two]
  num_three = substring[start_three..end_three]
  num_four = substring[start_four..end_four]
  num_five = substring[start_five..end_five]
  num_six = substring[start_six..end_six]
  
  last_draw = "#{num_one} #{num_two} #{num_three} #{num_four} #{num_five} #{num_six}"
  @last_draw = last_draw
  
  #Convert to integers for comparison
  num_one = num_one.to_i
  num_two = num_two.to_i
  num_three = num_three.to_i
  num_four = num_four.to_i
  num_five = num_five.to_i
  num_six = num_six.to_i 


  #Compare winning numbers to user ticket numbers
  nevada_now = DateTime.now - 8.hours
  all_array = NumberSet.all
  check_array = Array.new
  
  all_array.each do |set|
    if set.check_date.to_date == nevada_now.to_date
      check_array << set
    end
  end
  
    check_array.each do |set|
      check = set.set

      ticketnum_one = check[0..1]
      ticketnum_two = check[3..4]
      ticketnum_three = check[6..7]
      ticketnum_four = check[9..10]
      ticketnum_five = check[12..13]
      ticketnum_six = check[15..16]

      @check = "#{ticketnum_one} #{ticketnum_two} #{ticketnum_three} #{ticketnum_four} #{ticketnum_five} #{ticketnum_six}"


      ticketnum_one = ticketnum_one.to_i
      ticketnum_two = ticketnum_two.to_i
      ticketnum_three = ticketnum_three.to_i
      ticketnum_four = ticketnum_four.to_i      
      ticketnum_five = ticketnum_five.to_i
      ticketnum_six = ticketnum_six.to_i
      
      @checkstring = String.new
      if num_one == ticketnum_one
        @checkstring << "X"
      else
        @checkstring << "."
      end

      if num_two == ticketnum_two
        @checkstring << "  X"
      else
        @checkstring << "  ."
      end

      if num_three == ticketnum_three
        @checkstring << "  X"
      else
        @checkstring << "  ."
      end

      if num_four == ticketnum_four
        @checkstring << "  X"
      else
        @checkstring << "  ."
      end

      if num_five == ticketnum_five
        @checkstring << "  X"
      else
        @checkstring << "  ."
      end

      if num_six == ticketnum_six
        @checkstring << "  X"
      else
        @checkstring << "  ."
      end

      set.emails.each do |email|
        @email = email.email
        Usermailer.compare_email(@email, @check, @last_draw, @checkstring).deliver
      end
    end         
end

task :update_drawn_nums => :environment do
  require 'open-uri'
  file = open('http://www.megamillions.com/winning-numbers')
  contents = file.read
  contents.to_s
  startparse = contents.index('<div class="ball white">') + 22
  endparse = contents.index('<div class="ball gold">') + 30
  substring = contents[startparse..endparse]
  
  start_array = Array.new
  
  substring.to_enum(:scan,/">/).map do |m,|
      start_array << [$`.size,m]
  end
  
  start_one = start_array[0][0] + 2
  start_two = start_array[1][0] + 2
  start_three = start_array[2][0] + 2
  start_four = start_array[3][0] + 2
  start_five = start_array[4][0] + 2
  start_six = start_array[5][0] + 2
  
  end_array = Array.new
  substring.to_enum(:scan,/<\/div>/).map do |m,|
      end_array << [$`.size,m]
  end
  
  end_one = end_array[0][0] -1
  end_two = end_array[1][0] -1
  end_three = end_array[2][0] -1
  end_four = end_array[3][0] -1
  end_five = end_array[4][0] -1
  end_six = end_array[5][0] -1
  
  num_one = substring[start_one..end_one]
  num_two = substring[start_two..end_two]
  num_three = substring[start_three..end_three]
  num_four = substring[start_four..end_four]
  num_five = substring[start_five..end_five]
  num_six = substring[start_six..end_six]
  
  last_draw = "#{num_one} #{num_two} #{num_three} #{num_four} #{num_five} #{num_six}"
  
  #Compare winning numbers to user ticket numbers
  nevada_now = DateTime.now - 8.hours
  all_array = NumberSet.all
  current_array = Array.new
  
  all_array.each do |set|
    if set.check_date.to_date == nevada_now.to_date
      current_array << set
    end
  end
  
  current_array.each do |ticket|
      ticket.drawn_nums = last_draw
      ticket.save
  end         
end

