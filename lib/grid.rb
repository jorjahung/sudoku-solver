class Grid

	ROWS_MAX_SIZE = 9
	BOX_SIZE = 3
	SIZE = 81

	def initialize(puzzle_values)
		raise "Wrong number of values given: #{puzzle_values.length} out of #{SIZE} given" unless puzzle_values.length == SIZE
		@cells = puzzle_values.chars.map {|cell_value| Cell.new(cell_value) }
	end

	attr_accessor :cells

	def solve
		outstanding_before, looping = SIZE, false
		while !solved? && !looping
			try_to_solve
			outstanding = @cells.count {|c| c.solved?}
			looping = outstanding_before == outstanding
			outstanding_before = outstanding
		end
	end

	def try_to_solve
		while !solved? do
			cells.each_with_index do |cell, i|
				cell.update!(own_row(i), own_column(i), own_box(i))
			end
		end
	end
		
	def to_s
		cells.map {|cell| cell.value}.join
	end
		
	def own_row(cell_index)
		row_number = cell_index / ROWS_MAX_SIZE
		rows[row_number].map {|cell| cell.value}.select {|cell| cell > 0}
	end

	def own_column(cell_index)
		column_number = cell_index % ROWS_MAX_SIZE
		columns[column_number].map {|cell| cell.value}.select {|cell| cell > 0}
	end

	def own_box(cell_index)
		build_box_with(box_row_number_with(cell_index), min_box_column_number(cell_index), max_box_column_number(cell_index))
	end

	def build_box_with(box_row_number, min_box_column_number, max_box_column_number)
		[0,1,2].map{|index| calculate_box_row_with(index, box_row_number, min_box_column_number, max_box_column_number)}.flatten
	end

	def calculate_box_row_with(index, box_row_number, min_box_column_number, max_box_column_number)
		rows[box_row_number + index][min_box_column_number..max_box_column_number].map {|cell| cell.value}.select {|cell| cell > 0}
	end

	def box_row_number_with(cell_index)
		(cell_index / ROWS_MAX_SIZE) / BOX_SIZE * BOX_SIZE
	end

	def min_box_column_number(cell_index)
		(cell_index % ROWS_MAX_SIZE) / BOX_SIZE * BOX_SIZE
	end

	def max_box_column_number(cell_index)
		(cell_index % ROWS_MAX_SIZE) / BOX_SIZE * BOX_SIZE + 2
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