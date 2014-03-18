require 'spec_helper'
require './pather_app.rb'

describe 'line_adder' do

  before do
    @pathway = Pather.new('input.txt', 'test_output.text')
  end

  describe "no character found for index 1" do
    before do
      @line = [".", ".", ".", ".", ".", "#", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."]
    end

    it 'should add lines' do
      return_array = @pathway.line_adder(@line)
      expect(return_array).to eq([".....#.................." ])
    end

    it 'should find the position of index1' do
      @pathway.position_finder(@line)
      expect(@pathway.position[:index1]).to eq(5)
    end

  end

  describe "character found for index 1" do
    before do
      @line = [".", ".", ".", ".", ".", "#", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."]
      @line_vert = [".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."]
      @pathway.position[:index1] = 1
    end

    it 'should draw a vertical line' do
      return_array = @pathway.line_draw_vertical(@line_vert)
      expect(return_array).to eq([".*......................"])
    end

    it 'should find the position of index 2' do
      @pathway.position_finder(@line)
      expect(@pathway.position[:index2]).to eq(5)
    end

  end

  describe "character found for index 2" do
    before do
      @line = [".", ".", ".", ".", ".", "#", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", ".", "."]
      @pathway.position[:index1] = 1
      @pathway.position[:index2] = 5
    end

    it 'should draw a horizontal line' do
      return_array = @pathway.line_draw_horizontal(@line)
      expect(return_array).to eq([".****#.................."])
    end

  end

end
