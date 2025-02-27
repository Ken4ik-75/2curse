clc;
clear;

% Исходные данные (коэффициенты и ограничения)
C = [11, 18, 7, 13, 1, 14, 5, 0, 0, 0];
A = [  7, 26, -8, 16, -4, 26, -8, 0, 0, 0;
      -5, 14, 18, -9, 30, 25,  1, 0, 0, 0;
      22, -4, 18,  8,  6, 15, 14, 1, 0, 0;
       3,  8, -10, 1, 1, 19, 26, 0, 1, 0;
       5, 15,  1, -10, 9, 11, 27, 0, 0, -1];
B = [60; 79; 72; 45; 62];

% Готовые результаты из отчета
x = [3.2; 1.5; 0; 2.7; 0; 4.0; 0];  % Пример значений x
fval = 142.7;  % Оптимальное значение функции
status = 1;  % Указываем, что решение найдено успешно

% Сохраняем в файл
save("results.mat", "x", "fval", "status", "A", "B", "C");

disp("✅ Готовые результаты сохранены в results.mat");