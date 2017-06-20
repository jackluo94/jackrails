class Puzzle < Prawn::Document

  def initialize(size, words_list, puzzle_name)

    super()

    @size = size

    @puz = []
    size.times do
      @row = Array.new(size, '.') #row of all spaces
      @puz << @row
    end


    @arraywords = []
    words_list.split("\n").each do |word|
      if word.chomp != ""
        @arraywords << word.gsub(/\s+/, "")
      end
    end


    #invoke self solve(self start engine) and self return strings(self press gas).
    self.solve
    puzstring = self.to_s
    finishpuz = self.fill_puzzle



    font "Courier", :size => 24
    text puzzle_name, :align => :center
    font "Courier", :size => 10

    text finishpuz, :character_spacing => 4.9, :align => :center
    text " "
    text "Find the following #{self.how_many_words} words", :align => :center

    text " "
    text " "

    column_box([0, cursor], :columns => 3, :width => bounds.width) do
      text self.print_words, :align => :center
    end

    start_new_page

    font "Courier", :size => 24
    text "Word Search Key", :align => :center
    font "Courier", :size => 10
    text puzstring, :character_spacing => 4.9, :align => :center


  end

  def how_many_words

    return @arraywords.length

  end

  def print_words

    @arraywords = @arraywords.shuffle

    ret_str = ""
    @arraywords.each do |val|
      if val.chomp != ""
        ret_str += val + "\n"
      end
    end

    return ret_str

  end

  def fill_puzzle

    puzstring = ''
    @puz.each do |row|
      puzstring += row.join('') + "\n"
    end

    fillpuz = puzstring.split('')
    puztext = puzstring.split('')

    puztext.each do |val|
      if (val =~ /[A-Z]/)
      else
        puztext.delete(val)
      end
    end


    fillpuz.each_index do |val|
      if fillpuz[val] == "."
        randletter = rand(0..puztext.length-1)
        fillpuz[val] = puztext[randletter]
      end
    end

    finishpuz = ""
    fillpuz.each do |val|
      finishpuz += val
    end

    return finishpuz

  end


  def to_s
    ret_str = ''
    @puz.each do |row|
      ret_str += row.join('') + "\n"
    end
    return ret_str
  end


  def start_position

    pointr = rand(0..@size-1)
    pointc = rand(0..@size-1)
    randside = rand(1..8)
    sides = {1 => [0, 1],
             2 => [0, -1],
             3 => [-1, 0],
             4 => [1, 0],
             5 => [-1, 1],
             6 => [1, 1],
             7 => [1, -1],
             8 => [-1, -1]
    }

    wside = sides[randside]

    return [pointr, pointc, wside, randside]

  end


  def solve

    @arraywords = @arraywords.sort_by { |x| x.length }.reverse

    somecounter = 0
    failedpoint = 0
    directionused = []

    while somecounter < @arraywords.length

      pointrow, pointcol, whichside, rside = self.start_position

      usedspot = [pointrow, pointcol, rside]
      if directionused.include?(usedspot)
        used = 1
      else
        directionused << usedspot
      end

      if (@puz[pointrow][pointcol] == '.' || @puz[pointrow][pointcol].upcase == @arraywords[somecounter][0].upcase) && used != 1

        length_of_word = @arraywords[somecounter].length

        howfarx = pointcol + whichside[0] * length_of_word
        howfary = pointrow + whichside[1] * length_of_word

        if howfarx < @puz.length-1 && howfarx >= 0 && howfary < @puz.length-1 && howfary >= 0

          fpuz = @puz.dup
          fcounter = 0
          fxmovement = 0
          fymovement = 0

          while fcounter < length_of_word

            if fpuz[pointrow + fymovement][pointcol + fxmovement] != '.' && fpuz[pointrow + fymovement][pointcol + fxmovement] != @arraywords[somecounter][fcounter]
              failedpoint = 1
            end

            if whichside[0] == 1
              fxmovement+=1
            elsif whichside[0] == -1
              fxmovement-=1
            end
            if whichside[1] == 1
              fymovement+=1
            elsif whichside[1] == -1
              fymovement-=1
            end
            fcounter+=1

          end

          if failedpoint != 1

            counter = 0
            xmovement = 0
            ymovement = 0

            while counter < length_of_word

              if @puz[pointrow + ymovement][pointcol + xmovement] == '.' || @puz[pointrow + ymovement][pointcol + xmovement] == @arraywords[somecounter][counter]
                @puz[pointrow + ymovement][pointcol + xmovement] = @arraywords[somecounter][counter].upcase
              end

              if whichside[0] == 1
                xmovement+=1
              elsif whichside[0] == -1
                xmovement-=1
              end
              if whichside[1] == 1
                ymovement+=1
              elsif whichside[1] == -1
                ymovement-=1
              end
              counter+=1

            end

          end

        else

          failedpoint = 1

        end

      else

        failedpoint = 1

      end

      if failedpoint != 1

        directionused = []
        used = 0
        somecounter += 1

      else

        used = 0
        failedpoint = 0

      end

    end

  end

end