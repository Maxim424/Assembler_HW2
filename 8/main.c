#include <stdio.h>
#include "functions.h"

int main(int argc, char **argv) {
    int capacity = 100000;
    // Строка str.
    char str[capacity];
    int length;
    if (argc != 1 && argc!= 2 && argc != 3) {
        printf("You need to specify 2 files in the command line arguments: input and output");
        return 1;
    } else if (argc == 1) {
        length = get_line_from_console(str, capacity);
    } else if (argc == 2){
        length = generate_str(str, capacity);
    } else {
        length = get_line_from_file(argv, str, capacity);
    }

    // Массив со знаками препинания.
    char symbols[8] = {'.', ',', ';', ':', '!', '?', '(', ')'};
    // Массив с числом вхождений каждого знака из массива symbols.
    int values[8] = {0, 0, 0, 0, 0, 0, 0, 0};

    // Вызов функции calculate.
    calculate(str, symbols, values, length);

    if (argc == 1 || argc == 2) {
        // Вызов функции print_result_to_console.
        print_result_to_console(symbols, values);
    } else {
        // Вызов функции print_result_to_file.
        print_result_to_file(symbols, values, argv);
    }
}
