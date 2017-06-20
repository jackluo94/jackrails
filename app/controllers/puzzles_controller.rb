class PuzzlesController < ApplicationController

  def new
  end

  def show
    @puzzle_name = params[:puzzle_name]
    @puzzle_words = params[:puzzle_words]
    respond_to do |format|
      format.html
      format.pdf do


        #works because puzzle is also inheriting prawn

        if @puzzle_name.gsub(/\s+/, "") == "" || @puzzle_words.gsub(/\s+/, "") == ""
          puzPDF = Puzzle.new(45, "Error\nYou\nMonkey\nforgot\nname\nor\nforgot\nwords", "Lets not get carried away!")
          send_data puzPDF.render, filename: "Error.pdf", type: 'application/pdf'
        else
          puzPDF = Puzzle.new(45, @puzzle_words, @puzzle_name)
          send_data puzPDF.render, filename: "#{@puzzle_name}.pdf", type: 'application/pdf'
        end



      end
    end

  end

end
