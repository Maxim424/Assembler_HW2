    .intel_syntax noprefix  # Используем синтаксис intel
    
    .section .rodata        # Строки, которые буду использоваться для ввода/вывода, read-only
.LC0:
        .string "\nNumber of occurrences of different punctuation marks in a given ASCII string:"
.LC1:
        .string "%c\t%d\n"
        
    .section .text          # Секция с функциями
    .global  print_result   # Объявляем функцию как глобальную
    .type    print_result, @function    # Обозначаем, что print_result - это функция
print_result:       # Функция, которая печатает результат (количество вхождений знака препинания в строку)
        push    rbp         # Пролог функции
        mov     rbp, rsp
        sub     rsp, 32
        
        mov     r13, rdi     # Первый аргумент функции print_result (теперь используется регистр r13)
        mov     r14, rsi     # Второй аргумент функции print_result (теперь используется регистр r14)
        lea     rdi, .LC0[rip]              # Передаем строку .LC0 как аргумент функции вывода в консоль
        call    puts                        # Печатаем строку
        mov     r15d, 0        # i = 0 (теперь используется регистр r15d)
        jmp     .L2                         # Переход к секции .L2, начало цикла
.L3:
        mov     eax, r15d     # Записываем i в eax
        cdqe
        lea     rdx, [0+rax*4]              # Далее вычисляем symbols[i] и values[i]
        mov     rax, r14
        add     rax, rdx
        mov     edx, DWORD PTR [rax]
        mov     eax, r15d
        movsx   rcx, eax
        mov     rax, r13
        add     rax, rcx
        movzx   eax, BYTE PTR [rax]
        movsx   eax, al
        mov     esi, eax
        lea     rdi, .LC1[rip]              # Строка .LC1 как первых аргумент функции
        mov     eax, 0
        call    printf                      # Печатаем строку
        add     r15d, 1        # ++i
.L2:
        cmp     r15d, 7        # Проверка условия цикла
        jle     .L3                         # Если условие выполнено, переходим к телу цикла
        nop
        nop
        leave
        ret
        
    .global  calculate                      # Объявляем функцию как глобальную
    .type    calculate, @function           # Обозначаем, что calculate - это функция
calculate:      # Функция с вычислениями количества знаков препинания
        push    rbp                         # Пролог функции
        mov     rbp, rsp
        mov     r13, rdi     # Первый аргумент функции (теперь используется регистр r13)
        mov     r14, rsi     # Второй аргумент функции (теперь используется регистр r14)
        mov     r8, rdx      # Третий аргумент функции (теперь используется регистр r8)
        mov     r9d, ecx     # Четвертый аргумент функции (теперь используется регистр r9d)
        mov     r15d, 0      # i = 0 (теперь используется регистр r15d)
        jmp     .L5          # Переход к метке .L5, начало цикла
.L10:
        mov     r10d, 0        # j = 0 (теперь используется регистр r10d)
        jmp     .L6            # Переход к метке .L6, начало второго цикла
.L9:
        mov     eax, r15d     # Записываем i в eax
        movsx   rdx, eax
        mov     rax, r13
        add     rax, rdx
        movzx   edx, BYTE PTR [rax]
        mov     eax, r10d
        movsx   rcx, eax
        mov     rax, r14
        add     rax, rcx
        movzx   eax, BYTE PTR [rax]
        cmp     dl, al                      # Проверяем str[i] == symbols[j]
        jne     .L7                         # Переходим к метке .L7
        mov     eax, r10d
        cdqe
        lea     rdx, [0+rax*4]              # Далее выполняем вычисления: values[j] += 1
        mov     rax, r8
        add     rax, rdx
        mov     edx, DWORD PTR [rax]
        mov     eax, r10d
        cdqe
        lea     rcx, [0+rax*4]
        mov     rax, r8
        add     rax, rcx
        add     edx, 1
        mov     DWORD PTR [rax], edx
        jmp     .L8                         # переходим к метке .L8
.L7:
        add     r10d, 1        # ++j
.L6:
        cmp     r10d, 7        # Проверяем условие второго цикла
        jle     .L9                         # переходим к метке .L9
.L8:
        add     r15d, 1
.L5:
        mov     eax, r15d    # Записываем i в eax
        cmp     eax, r9d     # Проверяем условие цикла
        jl      .L10                        # Если выполняется, переходим к метке .L10
        nop
        nop
        pop     rbp
        ret
        
    .section .rodata                        # read-only строки
.LC2:
        .string "String input:"
        
    .section .text                          # Секция функций
    .global  main                           # Объявляем функцию как глобальную
    .type    main, @function                # Обозначаем, что main - это функция
main:       # Точка входа в программу
        push    rbp                         # Пролог
        mov     rbp, rsp
        push    rbx
        sub     rsp, 88
        mov     rax, rsp
        mov     rbx, rax
        mov     r13d, 100000  # capacity = 100000 (теперь используется регистр r13d)
        mov     rax, r13     # Далее объявляем массив char str[]
        mov   rdx, rax
        sub     rdx, 1
        mov     QWORD PTR [rbp-32], rdx
        mov   rdx, rax
        mov     r8, rdx
        mov     r9d, 0
        mov   rdx, rax
        mov     rsi, rdx
        mov     edi, 0
        cdqe
        mov     edx, 16
        sub     rdx, 1
        add     rax, rdx
        mov     edi, 16
        mov     edx, 0
        div     rdi
        imul    rax, rax, 16
        sub     rsp, rax
        mov     rax, rsp
        add     rax, 0
        mov     r14, rax     # (теперь используется регистр r14)
        mov     r15, 0       # i = 0 (теперь используется регистр r15)
        lea     rdi, .LC2[rip]              # Передача строки .LC2 в качестве параметра для функции вывода
        call    puts                        # Вызов функции вывода строки
.L14:   # Начало do-while
        mov     rax, QWORD PTR stdin[rip]   # Передача stdin в качестве параметра fgetc
        mov     rdi, rax
        call    fgetc                       # Вызов fgetc
        mov     DWORD PTR [rbp-44], eax     # Далее записываем str[i++] = ch
        mov     rax, r15
        lea     rdx, [rax+1]
        mov     r15, rdx
        mov     edx, DWORD PTR [rbp-44]
        mov     ecx, edx
        mov     rdx, r14
        cdqe
        mov     BYTE PTR [rdx+rax], cl
        mov     rax, r15
        cmp     rax, r13     # Сравниваем i >= capacity
        jge     .L16                        # Переходим к метке .L16
        cmp     DWORD PTR [rbp-44], -1      # Проверяем условие do-while
        jne     .L14                        # Возвращаемся к началу do-while, к метке .L14
        jmp     .L13                        # Идем далее, к метке .L13
.L16:
        nop
.L13:
        mov     rax, r15    # Записываем i в rax
        sub     eax, 1                      # Вычитаем 1 из eax
        mov     rdx, r14
        cdqe
        mov     BYTE PTR [rdx+rax], 0       # str[i-1] = '\0'
        mov     rax, r15     # Записываем i в rax
        sub     eax, 1                      # Вычитаем 1 из eax
        mov     DWORD PTR [rbp-48], eax     # length = i - 1
        movabs  rax, 2965689766566898734    # Далее объявление массивов symbols и values
        mov     QWORD PTR [rbp-56], rax
        mov     QWORD PTR [rbp-96], 0
        mov     QWORD PTR [rbp-88], 0
        mov     QWORD PTR [rbp-80], 0
        mov     QWORD PTR [rbp-72], 0
        mov     ecx, DWORD PTR [rbp-48] # Четвертый аргумент calculate
        lea     rdx, [rbp-96]           # Третий аргумент calculate
        lea     rsi, [rbp-56]           # Второй аргумент calculate
        mov     rax, r14
        mov     rdi, rax                # Первый аргумент calculate
        call    calculate               # Вызываем calculate
        lea     rdx, [rbp-96]
        lea     rax, [rbp-56]
        mov     rsi, rdx                # Второй аргумент print_result
        mov     rdi, rax                # Первый аргумент print_result
        call    print_result            # Вызываем print_result
        mov     rsp, rbx
        mov     eax, 0
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret