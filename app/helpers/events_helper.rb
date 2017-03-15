module EventsHelper
	def get_meal_by_time(time)
		hour = time.hour
		if hour == 0 
			return "at Midnight"
		elsif hour > 0 && hour <= 4
			return "#{time.hour} AM in the early morning"
		elsif hour > 4 && hour < 12
			return  "#{time.hour} AM in the morning"
		elsif hour == 12
			return "at Noon"
		elsif hour > 12 && hour <= 18
			return "#{time.hour-12} PM in the afternoon"
		elsif hour > 18 && hour < 24
			return "#{time.hour-12} PM in the evening"
		end
	end

	def get_meal_type_by_time(time)
		hour = time.hour
		if hour == 0
			return "a Midnight Snack"
		elsif hour > 0 && hour < 12
			return "Breakfast"
		elsif hour >= 12 && hour <= 16
			return "Lunch"
		elsif hour > 16 && hour <= 24
			return "Dinner"
		end
	end
end
