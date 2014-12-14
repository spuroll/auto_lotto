module NumberSetHelper
  
    def last_draw()
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
      
      return "#{num_one} #{num_two} #{num_three} #{num_four} #{num_five} #{num_six}"
       
    end
    
end
