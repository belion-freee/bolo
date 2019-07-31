RSpec.describe Bolo do
  it "has a version number" do
    expect(Bolo::VERSION).to eq("0.1.0")
  end

  context "when Array" do
    it "merge" do
      expect([{hoge: :hoge},{foo: :foo}].merge).to eq({hoge: :hoge, foo: :foo})
      expect([[:hoge, :hoge], [:foo, :foo]].merge).to eq({hoge: :hoge, foo: :foo})
      expect(["hoge","foo"].merge).to eq(["hoge","foo"])
    end
  end
end
