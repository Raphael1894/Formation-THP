require_relative '../lib/hello'

describe "the hello function" do
  it "says hello" do
    expect(hello).to eq("Hello World!")
  end
end
 