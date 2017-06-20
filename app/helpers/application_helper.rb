module ApplicationHelper

  def mini_calendar( month, year)

    cal_str = ""
    today = Date.new(year, month)

    previous_month = month - 1
    next_month = month + 1

    previous_year = year - 1
    next_year = year + 1

    beginning_day = today.at_beginning_of_month.strftime("%w").to_i

    end_day = today.at_end_of_month.strftime("%w").to_i

    if previous_month == 0
      previous_month = 12
      cal_str += link_to( "Previous", page_calendar_path(year: previous_year, month: previous_month), class: "monthLinks")
    else
      cal_str += link_to( "Previous", page_calendar_path(year: year, month: previous_month), class: "monthLinks")
    end


    if next_month == 13
      next_month = 1
      cal_str += link_to( "Next", page_calendar_path(year: next_year, month: next_month), class: "monthLinks")
    else
      cal_str += link_to( "Next", page_calendar_path(year: year, month: next_month), class: "monthLinks")
    end



    cal_str +=  <<table

    <br/>

    #{today.strftime("%^B")} #{year}

    <table border="1px solid white" class="centerThis">
      <thead>
        <td>Sun</td>
        <td>Mon</td>
        <td>Tue</td>
        <td>Wed</td>
        <td>Thu</td>
        <td>Fri</td>
        <td>Sat</td>
      </thead>

      <tr>
table


    # 1-31
    current_day = 1
    # Sun - Mon
    day_of_week = 1


    # December is always 31 days so no need to do previous year! Yay! problem solved.
    previous_month_num_days = Date.new(year, previous_month).end_of_month.day
    prev_mon_days_shown = previous_month_num_days - beginning_day + 1

    beginning_day.times do
      cal_str += "<td class='smallerDates'>#{prev_mon_days_shown}</td>"
      day_of_week += 1
      prev_mon_days_shown += 1
    end


    while current_day <= today.end_of_month.day
      cal_str += "<td>#{current_day}</td>"
      if day_of_week % 7 == 0
        cal_str += "</tr><tr>"
      end
      current_day += 1
      day_of_week += 1
    end

    next_month_days_shown = 1
    (6-end_day).times do
      cal_str += "<td class='smallerDates'>#{next_month_days_shown}</td>"
      next_month_days_shown += 1
    end


    cal_str += "</tr></table>"

    return cal_str.html_safe

  end



end
