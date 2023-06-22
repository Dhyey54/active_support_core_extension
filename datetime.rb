require "active_support"
require "active_support/core_ext/integer"
require "active_support/core_ext/date"
require "active_support/core_ext/time"
require "active_support/core_ext/date_time"

d = DateTime.current
p d #=> Thu, 22 Jun 2023 10:24:19 +0530

### seconds_since_midnight returns the number of seconds since midnight
p d.seconds_since_midnight #=> 37498

### utc gives you the same datetime in the receiver expressed in UTC
p d.utc #=> 2023-06-22 04:55:39.851758003 UTC

### predicate utc? says whether the receiver has UTC as its time zone
p d.utc? #=> false

### :years, :months, :weeks, :days, :hours, :minutes, and :seconds, and returns a datetime advanced as much as the present keys indicate
p d.advance(years: 1, months: 1, days: 1, hours: 1, minutes: 1, seconds: 1) #=> Tue, 23 Jul 2024 11:28:31 +0530

### change allows you to get a new datetime which is the same as the receiver except for the given options
p d.change(year: 2025, month: 2, day: 25, hour: 13, min: 23, sec: 40, offset: Rational(-6, 24)) #=> Tue, 25 Feb 2025 13:23:40 -0600
