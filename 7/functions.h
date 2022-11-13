#ifndef TEST_FUNCTIONS_H
#define TEST_FUNCTIONS_H

void print_result_to_console(char symbols[], int values[]);

void print_result_to_file(char symbols[], int values[], char **argv);

void calculate(const char str[], const char symbols[], int values[], int length);

int get_line_from_console(char str[], int capacity);

int get_line_from_file(char **argv, char str[], int capacity);

#endif //TEST_FUNCTIONS_H
