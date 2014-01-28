class Cell

	def initialize(value=0)
		@value = value.to_i
		@candidates = []
	end
	
	attr_accessor :value


	def solved?
		value !=0
	end

	def candidates

	end

	def solve
	end
	
end