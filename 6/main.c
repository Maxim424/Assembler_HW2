#include <stdio.h>

// Функция print_result для вывода результата.
void print_result(char symbols[], int values[]) {
    printf("Number of occurrences of different punctuation marks in a given ASCII string:\n");
    for (int i = 0; i < 8; ++i) {
        printf("%c\t%d\n", symbols[i], values[i]);
    }
}

// Функция calculate для заполнения массива values.
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

// Точка входа в программу.
int main() {
    // Строка str.
    char str[1000];
    int i = 0;
    int ch;
    // Ввод строки.
    printf("String input:\n");
    do {
        ch = fgetc(stdin);
        str[i++] = ch;
    } while(ch != -1);
    str[i-1] = '\0';
    int length = i - 1;

    // Массив со знаками препинания.
    char symbols[8] = {'.', ',', ';', ':', '!', '?', '(', ')'};
    // Массив с числом вхождений каждого знака из массива symbols.
    int values[8] = {0, 0, 0, 0, 0, 0, 0, 0};

    // Вызов функции calculate.
    calculate(str, symbols, values, length);

    // Вызов функции print_result.
    print_result(symbols, values);
}
