main :: () {
    //input := read_entire_file("sample.txt");
    input := trim(read_entire_file("input.txt"));
    lines := split(input, "\n");

    first_result := 0;

    N_RED   :: 12;
    N_GREEN :: 13;
    N_BLUE  :: 14;

    for line: lines {
        if !line.count {
            continue;
        }

        split_line := split(line, ":");

        game := split_line[0];
        sets := split(split_line[1], ";");

        possible := true;

        for set: sets {
            cubes := split(set, ",");

            for cube: cubes {
                number := parse_int(*trim(cube));

                if find_index_from_right(cube, "red") >= 0 {
                    if number > N_RED {
                        possible = false;
                        break set;
                    }
                } else if find_index_from_right(cube, "green") >= 0 {
                    if number > N_GREEN {
                        possible = false;
                        break set;
                    }
                } else if find_index_from_right(cube, "blue") >= 0 {
                    if number > N_BLUE {
                        possible = false;
                        break set;
                    }
                }
            }
        }

        if possible {
            first_result += parse_int(*slice(game, "Game ".count, 3));
        }
    }

    print("First:  %\n", first_result);

    second_result := 0;

    for line: lines {
        if !line.count {
            continue;
        }

        split_line := split(line, ":");

        sets := split(split_line[1], ";");

        min_red   := 0;
        min_green := 0;
        min_blue  := 0;

        for set: sets {
            cubes := split(set, ",");

            for cube: cubes {
                number := parse_int(*trim(cube));

                if find_index_from_right(cube, "red") >= 0 {
                    min_red = max(number, min_red);
                } else if find_index_from_right(cube, "green") >= 0 {
                    min_green = max(number, min_green);
                } else if find_index_from_right(cube, "blue") >= 0 {
                    min_blue = max(number, min_blue);
                }
            }
        }

        second_result += min_red * min_green * min_blue;
    }

    print("Second: %\n", second_result);
}

#import "Basic";
#import "Math";
#import "File";
#import "String";
