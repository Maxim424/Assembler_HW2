#include <stdio.h>

// Вывод результата в консоль.
void print_result_to_console(char symbols[], int values[]) {
    printf("\nNumber of occurrences of different punctuation marks in a given ASCII string:\n");
    for (int i = 0; i < 8; ++i) {
        printf("%c\t%d\n", symbols[i], values[i]);
    }
}

// Вывод результата в файл.
void print_result_to_file(char symbols[], int values[], char **argv) {
    FILE *f = fopen(argv[2],"w+");\
    printf("The result is written to the file!");
    fprintf(f, "Number of occurrences of different punctuation marks in a given ASCII string:\n");
    for (int i = 0; i < 8; ++i) {
        fprintf(f, "%c\t%d\n", symbols[i], values[i]);
    }
    fclose(f);
}

// Заполнение массива values.
void calculate(const char str[], const char symbols[], int values[], int length) {
    for (int i = 0; i < length; ++i) {
        for (int j = 0; j < 8; ++j) {
            if (str[i] == symbols[j]) {
                values[j] += 1;
                break;
            }
        }
    }
}

// Ввод строки из консоли
int get_line_from_console(char str[], int capacity) {
    int i = 0;
    int ch;
    // Ввод строки.
    printf("String input:\n");
    do {
        ch = fgetc(stdin);
        str[i++] = ch;
        if (i >= capacity) {
            break;
        }
    } while(ch != -1);
    str[i-1] = '\0';
    return i - 1;
}

// Ввод строки из файла
int get_line_from_file(char **argv, char str[], int capacity) {
    FILE *f = fopen(argv[1], "r");

    int i = 0;
    int ch;
    // Ввод строки.
    do {
        ch = fgetc(f);
        str[i++] = ch;
        if (i >= capacity) {
            break;
        }
    } while(ch != -1);
    fclose(f);
    str[i-1] = '\0';
    return i - 1;
}