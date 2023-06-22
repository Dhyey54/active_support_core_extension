require "active_support"
require "active_support/core_ext/integer"
require "active_support/core_ext/date"
require "active_support/core_ext/time"
require "active_support/core_ext/date_time"

d = Date.current
p d #=> Thu, 22 Jun 2023
p d.beginning_of_week #=> Mon, 19 Jun 2023
p d.beginning_of_week(:sunday) #=> Sun, 18 Jun 2023
p d.end_of_week #=> Sun, 25 Jun 2023
p d.end_of_week(:sunday) #=> Sat, 24 Jun 2023

### monday and sunday return the dates for the previous Monday and next Sunday, respectively
p d.monday #=> Mon, 19 Jun 2023
p d.sunday #=> Sun, 25 Jun 2023

### next_week receives a symbol with a day name in English (default is Date.beginning_of_week, or config.beginning_of_week, or :monday) and it returns the date corresponding to that day
p d.next_week #=> Mon, 26 Jun 2023
p d.next_week(:thursday) #=> Thu, 29 Jun 2023

# method prev_week is analogous
p d.prev_week #=> Mon, 12 Jun 2023
p d.prev_week(:thursday) #=> Thu, 15 Jun 2023

p d.beginning_of_month #=> Thu, 01 Jun 2023
p d.end_of_month #=> Fri, 30 Jun 2023
p d.beginning_of_quarter #=> Sat, 01 Apr 2023
p d.end_of_quarter #=> Fri, 30 Jun 2023

p d.years_ago(10) #=> Sat, 22 Jun 2013
p d.years_since(10) #=> Wed, 22 Jun 2033

p d.months_ago(2) #=> Sat, 22 Apr 2023
p d.months_since(2) #=> Tue, 22 Aug 2023

p d.weeks_ago(2) #=> Thu, 08 Jun 2023
p d.weeks_since(2) #=> Thu, 06 Jul 2023

p d.advance(years: 2, months: 6, weeks: -3, days: -2) #=> Sat, 29 Nov 2025

### change allows you to get a new date which is the same as the receiver except for the given year, month, or day
p d.change(year: 2011, month: 11) #=> Tue, 22 Nov 2011
# p d.change(month: 2).change(day: 31) #=> Error

### Duration objects can be added to and subtracted from dates
p d + 1.year
p d - 3.hours

d = DateTime.current
### beginning_of_day returns a timestamp at the beginning of the day
### end_of_day returns a timestamp at the end of the day
# beginning_of_day is aliased to at_beginning_of_day, midnight, at_midnight
p d.beginning_of_day #=> Thu, 22 Jun 2023 00:00:00 +0530
p d.end_of_day #=> Thu, 22 Jun 2023 23:59:59 +0530

### beginning_of_hour returns a timestamp at the beginning of the hour
### end_of_hour returns a timestamp at the end of the hour
p d.beginning_of_hour #=> Thu, 22 Jun 2023 10:00:00 +0530
p d.end_of_hour #=> Thu, 22 Jun 2023 10:59:59 +0530

### beginning_of_minute returns a timestamp at the beginning of the minute
### end_of_minute returns a timestamp at the end of the minute
p d.beginning_of_minute #=> Thu, 22 Jun 2023 10:20:00 +0530
p d.end_of_minute #=> Thu, 22 Jun 2023 10:20:59 +0530

### ago receives a number of seconds as argument and returns a timestamp those many seconds ago from midnight
### since moves forward
p d.ago(20) #=> Thu, 22 Jun 2023 10:20:34 +0530
p d.since(20) #=> Thu, 22 Jun 2023 10:21:14 +0530
