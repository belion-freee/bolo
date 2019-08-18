RSpec.describe Bolo do
  it "has a version number" do
    expect(Bolo::VERSION).to eq("0.1.0")
  end

  context "when Enumerable" do
    it 'maps' do
      expect(["hoge", "foo"].maps(:+, 's')).to eq(["hoges", "foos"])
      expect(["hoge", "foo"].maps(:concat, 's', '!')).to eq(["hoges!", "foos!"])
      expect((1..3).maps(:-, 1)).to eq([0, 1, 2])
      expect((1..3).maps(:*, 2)).to eq([2, 4, 6])
      expect((1..3).maps(:<=, 2)).to eq([true, true, false])
      expect([[1,2,3], [4,5,6]].maps(:[], 1)).to eq([2, 5])
      expect([{ hoge: "hoge1", foo: "foo1" }, { hoge: "hoge2", foo: "foo2" }].maps(:[], :hoge)).to eq(["hoge1", "hoge2"])
    end
  end

  context "when Array" do
    it "merge" do
      expect([{hoge: :hoge},{foo: :foo}].merge).to eq({hoge: :hoge, foo: :foo})
      expect([[:hoge, :hoge], [:foo, :foo]].merge).to eq({hoge: :hoge, foo: :foo})
      expect(["hoge", "foo", :foo, 100].merge).to eq({"hoge" => "foo", foo: 100})
      expect { ["hoge", "foo", :foo].merge }.to raise_error(ArgumentError)
    end

    it 'uniqs' do
      expect([1,1].uniqs).to eq []
      expect([1,2,2].uniqs).to eq [1]
      expect([1,2,2,3,3,3,4].uniqs).to eq [1,4]
    end

    it 'ununiqs' do
      expect([1,2].ununiqs).to eq []
      expect([1,2,2].ununiqs).to eq [2]
      expect([1,2,2,3,3,3,4].ununiqs).to eq [2,3]
    end

    it 'uniq?' do
      expect([1,2,3].uniq?).to eq true
      expect([1,2,2].uniq?).to eq false
    end

    it 'ziph' do
      expect([1,2,3].ziph(:hoge, :foo, :fuga)).to eq({ 1 => :hoge, 2 => :foo, 3 => :fuga })
      expect { [1,2,3].ziph(:hoge, :foo) }.to raise_error(IndexError)
    end
  end

  context 'when Object' do
    before(:all) {
      @test = :test
    }

    after(:all) {
      @test = nil
      @hoge = nil
    }

    it 'inv' do
      expect(self.inv(:@test)).to eq :test
      expect(self.inv(:@hoge)).not_to be

      @hoge = inv(:@hoge, :hoge)
      expect(self.inv(:@hoge)).to eq :hoge

      expect(self.inv).to include(:@test, :@hoge)
    end

    it 'inv?' do
      expect(self.inv?(:@test)).to eq true
      expect(self.inv?(:@hoge)).to eq false
    end
  end

  context "when String" do
    it 'integer?' do
      expect("100".integer?).to eq(true)
      expect("001".integer?).to eq(true)
      expect("hoge".integer?).to eq(false)
      expect("1hoge".integer?).to eq(false)
    end
  end
end
