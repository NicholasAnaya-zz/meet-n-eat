module EventsHelper
	def get_meal_by_time(time)
		hour = time.hour
		if hour == 0 
			return "at Midnight"
		elsif hour > 0 && hour <= 4
			return get_actual_time(time) + " Early Morning"
		elsif hour > 4 && hour < 12
			return get_actual_time(time) + " Morning"
		elsif hour == 12
			return "at Noon"
		elsif hour > 12 && hour <= 18
			return get_actual_time(time) + " Afternoon"
		elsif hour > 18 && hour < 24
			return get_actual_time(time) + " Evening"
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

	def get_actual_time(time)
		return time.hour > 12 ? "#{time.hour-12} PM in the" : "#{time.hour} AM in the"
	end
end
