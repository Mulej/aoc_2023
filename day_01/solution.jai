main :: () {
    input := read_entire_file("input.txt");
    lines := split(input, "\n");

    first_result := 0;

    for line: lines {
        if !line.count  continue;

        first_index := find_index_of_any_from_left (line, DIGITS);
        last\_index := find_index_of_any_from_right(line, DIGITS);

        if first_index != -1 && last_index != -1 {
            first_result += (line[first_index] - ZERO) * 10 + (line[last_index] - ZERO);
        }
    }

    print("First:  %\n", first_result);

    second_result := 0;

    for line: lines {
        if !line.count  continue;

        first_word_index := S64_MAX;
        first_value := 0;

        last\_word_index := -1;
        last\_value := 0;

        for word: DIGIT_WORDS {
            first_index := find_index_from_left(line, word);

            if first_index != -1 && first_index < first_word_index {
                first_word_index = first_index;
                first_value = it_index;
            }

            last_index := find_index_from_right(line, word);

            if last_index != -1 && last_index > last_word_index {
                last_word_index = last_index;
                last_value = it_index;
            }
        }

        first_digit_index := find_index_of_any_from_left (line, DIGITS);
        last\_digit_index := find_index_of_any_from_right(line, DIGITS);

        if first_digit_index != -1 && first_digit_index < first_word_index {
            first_value = line[first_digit_index] - ZERO;
        }

        if last_digit_index != -1 && last_digit_index > last_word_index {
            last_value = line[last_digit_index] - ZERO;
        }

        second_result += first_value * 10 + last_value;
    }

    print("Second: %\n", second_result);
}

ZERO :: #char "0";
DIGITS :: "0123456789";
DIGIT_WORDS :: string.["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];

#import "Basic";
#import "Math";
#import "File";
#import "String";
