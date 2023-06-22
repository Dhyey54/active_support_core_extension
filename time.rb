require "active_support"
require "active_support/core_ext/integer"
require "active_support/core_ext/time"

t = Time.current

puts t

### all_day returns a range representing the whole day of the current time
puts t.all_day #=> 2023-06-22 00:00:00 +0530..2023-06-22 23:59:59 +0530

### all_week, all_month, all_quarter and all_year all serve the purpose of generating time ranges
puts t.all_week #=> 2023-06-19 00:00:00 +0530..2023-06-25 23:59:59 +0530
puts t.all_month #=> 2023-06-01 00:00:00 +0530..2023-06-30 23:59:59 +0530
puts t.all_quarter #=> 2023-04-01 00:00:00 +0530..2023-06-30 23:59:59 +0530
puts t.all_year #=> 2023-01-01 00:00:00 +0530..2023-12-31 23:59:59 +0530

### prev_day and next_day return the time in the last or next day
puts t.prev_day #=> 2023-06-21 10:55:04 +0530
puts t.next_day #=> 2023-06-23 10:55:04 +0530

### prev_month and next_month return the time with the same day in the last or next month
puts t.prev_month #=> 2023-05-22 10:55:45 +0530
puts t.next_month #=> 2023-07-22 10:55:45 +0530

### prev_year and next_year return the time in the last or next day
puts t.prev_year #=> 2022-06-22 10:57:19 +0530
puts t.next_year #=> 2024-06-22 10:57:19 +0530

### prev_quarter and next_quarter return the time with the same day in the last or next month
puts t.prev_quarter #=> 2023-03-22 10:57:19 +0530
puts t.next_quarter #=> 2023-09-22 10:57:19 +0530
