main :: () {
    //input := read_entire_file("sample.txt");
    input := trim(read_entire_file("input.txt"));
    lines := split(input, "\n");

    first_result := 0;

    for line: lines {
    }

    print("First:  %\n", first_result);

    second_result := 0;

    for line: lines {
    }

    print("Second: %\n", second_result);
}

#import "Basic";
#import "File";
#import "String";
