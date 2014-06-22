# Ruby Turing Machine

## Description

This is a turing machine interpreter packaged as a command line tool. I cobbled it together by finding a large part of the code readily-implemented in just the way I wanted it on the web and then adding some additional parameters and options.

## Installation

```bash
gem install ruby-tm
```

## Usage

Run `tm` in a terminal for the basic help.

You will need to supply a text file with the turing machine instructions that you want to add to the machine. These have to be of the following structure:

```
CURR_STATE READ_VAL NEW_STATE WRITE_VAL DIRECTION
```

Example: `read_first b append_b _ L`
Interpretation: if we're on the `read_first` label and the value under the tape head is on the `b` letter, change the label to the `append_b` label, write `blank` under the tape head and move the tape head to the Left.

`tm` will read the supplied file and parse any lines that match the aforementioned structure and ignore everything else. It will then proceed to run the instructions on the provided starting tape, and will output the resulting tape at the end.

## Credit where credit is due

The code for the interpreter is based off of a certain Marcelo's [subimission](https://www.ruby-forum.com/attachment/1899/turing.rb) to quiz [#162](https://www.ruby-forum.com/topic/152512#673087) of the "Ruby Quiz 2". I found it while searching for a ready-made turing machine command line interpreter. Marcelo submitted it as a guest account and as such I could not contact him for permission to repackage his code as the present RubyGem package, so I decided to do so anyway. Since I found most of the code freely on the internet, I have kept it unlicensed under the public domain.
