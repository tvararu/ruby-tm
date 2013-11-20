#!/usr/bin/env ruby

VERBOSE = (!ARGV[2].nil? && ARGV[2].include?("v"))

class Tape
    def initialize(str=nil)
        @tape = (str.nil? ? "" : str.dup)
        @position = 0
    end

    def left
        if @position == 0
            @tape.insert(@position, "_")
        else
            @position -= 1
        end
    end

    def right
        ensure_current_position_exists
        @position += 1
    end

    def read
        ensure_current_position_exists
        @tape[@position, 1]
    end

    def write(val)
        ensure_current_position_exists
        @tape[@position] = val
    end

    def to_s
        @tape.sub(/^_+/, '').sub(/_.*/, '')
    end

    private

    def ensure_current_position_exists
        if @position == @tape.length
            @tape << "_"
        end
    end
end

class Transition
    def initialize(new_state, new_char, dir)
        @new_state = new_state.to_sym
        @new_char = new_char
        @dir = dir
    end

    def apply
        print "#{@new_state} -> " if VERBOSE
        yield @new_char, @dir
        return @new_state
    end
end

class Instructions
    attr_accessor :initial_state

    def initialize(filename)
        re = Regexp.compile('\s* (\w+) \s+ (\w) \s+ (\w+) \s+ (\w) \s+ ([RL])',
                Regexp::EXTENDED)
        @instructions = Hash.new { |hash, key| hash[key] = Hash.new }

        File.open(filename) do |file|
            file.each_line do |line|
                if data = re.match(line) then
                    st = data[1].to_sym
                    ch = data[2]
                    @instructions[st][ch] = Transition.new(*data[3 .. 5])

                    if self.initial_state.nil?
                        self.initial_state = st
                    end
                end
            end
        end
    end

    def get_transition(state, char)
        if @instructions.has_key?(state) && @instructions[state].has_key?(char)
            return @instructions[state][char]
        else
            return nil
        end
    end

    def run(tape, state = self.initial_state)
        raise("Invalid tape") unless
            tape.respond_to?(:left)  &&
            tape.respond_to?(:right) &&
            tape.respond_to?(:read)  &&
            tape.respond_to?(:write)

        while t = get_transition(state, tape.read)
            state = t.apply do |ch, dir|
                tape.write(ch)
                case dir
                    when 'L'
                        tape.left
                    when 'R'
                        tape.right
                    else
                        raise "Invalid direction"
                end
                puts tape if VERBOSE
            end
        end
    end
end

if __FILE__ == $0
    if ARGV[0].nil?
      abort("usage: tm <input_file> <input_tape>\nexample: tm reverse.tm something\ngnihtemos\nUse -v, --version, -version, v, version or generally any string containing v as the 3rd parameter for verbose mode.")
    end
    ins = Instructions.new(ARGV.shift)
    tape = Tape.new(ARGV.shift)
    ins.run(tape)

    puts "#{tape}"
end