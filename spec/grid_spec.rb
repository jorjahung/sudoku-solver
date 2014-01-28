require_relative "../lib/grid"
require_relative "../lib/cell"


describe Grid do
	let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
	let(:grid) { Grid.new (puzzle) }

	context "Initialization" do

		it "should have 81 cells" do
			expect(grid.cells.count).to eq(81)
		end

		it "should not be solved" do
			expect(grid).to_not be_solved
		end
	end

	context "Finding out rows" do

		it "own_row(0) should give the solved numbers from row 1" do
			expect(grid.own_row(0)).to eq([1,5,3,2]) 
		end

		it "own_row(9) should give the solved numbers from row 2" do
			expect(grid.own_row(9)).to eq([1,9,6]) 
		end

		it "own_row(12) should give the solved numbers from row 2" do
			expect(grid.own_row(12)).to eq([1,9,6]) 
		end
	end

	context "Finding out columns" do

		it "own_column(27) should give the solved numbers from column 1" do
			expect(grid.own_column(27)).to eq([2,4,5,9,8]) 
		end

		it "own_column(10) should give the solved numbers from column 2" do
			expect(grid.own_column(10)).to eq([1,7,9,6,3]) 
		end

		it "own_column(80) should give the solved numbers from column 9" do
			expect(grid.own_column(80)).to eq([2,6,7,5]) 
		end
	end

	context "Finding out the box" do
		it "own_box(0) should give the solved numbers from box 1A" do
			expect(grid.own_box(0)).to eq([1,5,2,7]) 
		end

		it "own_box(27) should give the solved numbers from box 1B" do
			expect(grid.own_box(27)).to eq([4,9,5,1,3]) 
		end

		it "own_box(80) should give the solved numbers from box 3A" do
			expect(grid.own_box(26)).to eq([2, 9, 6, 4,3]) 
		end

	end


end