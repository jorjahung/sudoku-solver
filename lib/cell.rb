class Cell

	def initialize(value=0)
		@value = value.to_i
		@candidates = []
	end
	
	attr_accessor :value


	def solved?
		value !=0
	end

	def candidates=(v)
		@value = v.first if v.length == 1
		@candidates = v
	end

	def update!(row, column, box)
		return if solved?
		self.candidates = (1..9).to_a - row - column - box
	end
end