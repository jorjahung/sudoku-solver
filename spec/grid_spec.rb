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

		it "row(0) should give the solved numbers from row 1" do
			expect(grid.own_row(0)).to eq([1,5,3,2]) 
		end

		it "row(9) should give the solved numbers from row 2" do
			expect(grid.own_row(9)).to eq([1,9,6]) 
		end

		it "row(12) should give the solved numbers from row 2" do
			expect(grid.own_row(12)).to eq([1,9,6]) 
		end
	end

	context "Finding out columns" do

		it "column(27) should give the solved numbers from column 1" do
			expect(grid.own_column(27)).to eq([2,4,5,9,8]) 
		end

		it "column(10) should give the solved numbers from column 2" do
			expect(grid.own_column(10)).to eq([1,7,9,6,3]) 
		end

		it "column(80) should give the solved numbers from column 9" do
			expect(grid.own_column(80)).to eq([2,6,7,5]) 
		end
	end

end