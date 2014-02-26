require 'spec_helper'

describe "pather" do

  after(:all) do
    File.delete './output.txt'
  end

  it "reads a file and prints a path between the two #" do
    `ruby pather.rb <input.txt >output.txt`
    IO.read('./output.txt').should == IO.read('./expected.txt')
  end

end