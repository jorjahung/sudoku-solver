class Cell

	def initialize(value=0)
		@value = value.to_i
		@candidates = []
	end
	
	attr_accessor :value, :candidates


	def solved?
		value !=0
	end

	def candidates=(v)
		@candidates = v
		@value = v.first if v.length == 1
	end

	def assume(v) 
		@value = v 
	end

	def update!(row, column, box)
		return if solved?
		self.candidates = (1..9).to_a - row - column - box
	end
end