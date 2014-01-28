require_relative "../lib/cell"

describe Cell do
	context "Creating new cells" do
	let(:cell) { Cell.new }
	it "should have 0 as a default value" do
		expect(cell.value).to eq(0)
	end

	it "should be unsolved if the value is 0" do
		expect(cell).not_to be_solved
	end
	end

	
	it "should have a list of possible values" do
	end

end