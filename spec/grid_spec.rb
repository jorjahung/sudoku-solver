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
			expect(grid.row(0)).to eq([1,5,3,2]) 
		end

		it "row(9) should give the numbers from row 2" do
			expect(grid.row(10)).to eq([1,9,6]) 
		end

		it "row(12) should give the numbers from row 2" do
			expect(grid.row(10)).to eq([1,9,6]) 
		end
	end

end