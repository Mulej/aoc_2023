main :: () {
    //input := read_entire_file("sample.txt");
    input := trim(read_entire_file("input.txt"));
    lines := split(input, "\n");

    first_result := 0;

    for line: lines {
        lists := split(split(line, ":")[1], "|");

        winning_strings := split(lists[1], " ");

        selected_strings := split(lists[0], " ");

        winning_numbers: [25]u8;
        idx := 0;

        for s: winning_strings {
            if !s.count then continue;

            defer idx += 1;

            winning_numbers[idx] = xx parse_int(*trim(s));
        }

        count := 0;

        for s: selected_strings {
            if !s.count then continue;

            number := parse_int(*trim(s));

            if array_find(winning_numbers, xx number) then count += 1;
        }

        if count then first_result += xx pow(2,xx (count - 1));
    }

    print("First:  %\n", first_result);

    second_result := 0;

    all_copies: [208]int;

    for line, line_idx: lines {
        copies := all_copies[line_idx] + 1;

        lists := split(split(line, ":")[1], "|");

        winning_strings := split(lists[1], " ");

        selected_strings := split(lists[0], " ");

        winning_numbers: [25]u8;
        idx := 0;

        for s: winning_strings {
            if !s.count then continue;

            defer idx += 1;

            winning_numbers[idx] = xx parse_int(*trim(s));
        }

        count := 0;

        for s: selected_strings {
            if !s.count then continue;

            number := parse_int(*trim(s));

            if array_find(winning_numbers, xx number) then count += 1;
        }

        for 1..count {
            all_copies[line_idx + it] += copies;
        }

        second_result += copies;
    }

    print("Second: %\n", second_result);
}

#import "Basic";
#import "File";
#import "String";
#import "Math";
