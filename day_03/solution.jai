cell :: struct {
    id    : u16;
    number: u16;
}

main :: () {
    //input := read_entire_file("sample.txt");
    input := trim(read_entire_file("input.txt"));
    lines := split(input, "\n");

    id := 1;

    cells: [140][140]cell;

    for line, line_idx: lines {
        char_idx := 0;
        while char_idx < line.count {
            defer char_idx += 1;

            if is_digit(line[char_idx]) {
                number := parse_int(*slice(line, char_idx, 3));

                while char_idx < line.count && is_digit(line[char_idx]) {
                    cells[line_idx][char_idx].number = xx number;
                    cells[line_idx][char_idx].id = xx id;
                    char_idx += 1;
                }

                id += 1;
            }
        }
    }

    first_result := 0;

    for line, line_idx: lines {
        char_idx := 0;
        while char_idx < line.count {
            defer char_idx += 1;
            char := line[char_idx];

            if find_index_from_left(SKIPPABLE_CHARS, char) >= 0 then continue;

            seen_ids: [8]u16;

            for lookup_idx: LOOKUP_TABLE {
                lookup_line_idx := line_idx + lookup_idx[0];
                lookup_char_idx := char_idx + lookup_idx[1];
                if lookup_line_idx >= 0 && lookup_char_idx >= 0
                && lookup_line_idx < cells.count && lookup_line_idx < cells[lookup_line_idx].count {
                    cell := cells[lookup_line_idx][lookup_char_idx];

                    if !array_find(seen_ids, cell.id) {
                        seen_ids[it_index] = cell.id;
                        first_result += cell.number;
                    }
                }
            }
        }
    }

    print("First:  %\n", first_result);

    second_result := 0;

    for line, line_idx: lines {
        char_idx := 0;
        while char_idx < line.count {
            defer char_idx += 1;
            char := line[char_idx];

            if char != #char "*" then continue;

            seen_ids: [8]u16;

            adjacent_numbers := 0;
            gear_ratio := 1;

            for lookup_idx: LOOKUP_TABLE {
                lookup_line_idx := line_idx + lookup_idx[0];
                lookup_char_idx := char_idx + lookup_idx[1];
                if lookup_line_idx >= 0 && lookup_char_idx >= 0
                && lookup_line_idx < cells.count && lookup_line_idx < cells[lookup_line_idx].count {
                    cell := cells[lookup_line_idx][lookup_char_idx];

                    if !array_find(seen_ids, cell.id) {
                        seen_ids[it_index] = cell.id;
                        gear_ratio *= cell.number;
                        adjacent_numbers += 1;
                    }
                }
            }

            if adjacent_numbers == 2 {
                second_result += gear_ratio;
            }
        }
    }

    print("Second: %\n", second_result);
}

SKIPPABLE_CHARS :: "0123456789.";
LOOKUP_TABLE : [8][2]int : ([2]int).[int.[0, -1], int.[1, -1], int.[1, 0], int.[1, 1], int.[0, 1], int.[-1, 1], int.[-1, 0], int.[-1, -1]];

#import "Basic";
#import "File";
#import "String";
