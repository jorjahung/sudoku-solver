class Grid

	ROWS_MAX_SIZE = 9
	BOX = 3
	
	def initialize(value)
		@cells = value.split(//).map {|cell_value| Cell.new(cell_value) }
	end

	attr_accessor :cells


	def own_row(cell_index)
		row_number = cell_index / ROWS_MAX_SIZE
		rows[row_number].map {|cell| cell.value}.select {|cell| cell > 0}
	end

	def own_column(cell_index)
		column_number = cell_index % ROWS_MAX_SIZE
		columns[column_number].map {|cell| cell.value}.select {|cell| cell > 0}
	end

	def rows
		cells.each_slice(9).to_a
	end

	def columns
		rows.transpose
	end




	def solved?
		cells.all? {|cell| cell.solved? }
	end

end