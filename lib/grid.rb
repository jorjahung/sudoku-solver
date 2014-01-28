class Grid

	ROWS_MAX_SIZE = 9
	BOX = 3
	
	def initialize(value)
		@cells = value.split(//).map {|cell_value| Cell.new(cell_value) }
	end

	attr_accessor :cells


	def row(cell_index)
		cell_index = cell_index - cell_index % ROWS_MAX_SIZE
		self.cells[(cell_index)..(cell_index+8)].map {|cell| cell.value }.select {|cell| cell > 0}
	end

	def solved?
		cells.all? {|cell| cell.solved? }
	end





end