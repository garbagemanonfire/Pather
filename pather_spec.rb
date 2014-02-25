it "reads a file and prints a hash of prefixes when given the -p option" do
    `bin/txt2csv analyze -p -i spec/testfile.txt -o spec/histogram.txt`
    IO.read('spec/histogram.txt').should == IO.read('spec/expected_prefixes.txt')
  end

  it "reads a file and prints a hash of suffixes when given the -s option" do
    `bin/txt2csv analyze -s -i spec/testfile.txt -o spec/histogram.txt`
    IO.read('spec/histogram.txt').should == IO.read('spec/expected_suffixes.txt')
  end