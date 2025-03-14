clc;
clear all;
close all;

% Вариант №10
disp('Лабораторная работа №3. Оптимизация размещения узла доступа');
disp('Вариант 10');
disp('--------------------------------------');

% Весовые коэффициенты вершин графа (количество абонентов в каждом пункте)
P = [90, 100, 110, 70, 50, 60, 80, 100];

% Матрица расстояний между населёнными пунктами (симметричная!)
% Для простоты: кольцевая структура, расстояние между соседними = 5 км
% Остальные расстояния считаются как кратчайшие пути
D = [
    0   5  10  15  20  25  30  35;  % x1
    5   0   5  10  15  20  25  30;  % x2
   10   5   0   5  10  15  20  25;  % x3
   15  10   5   0   5  10  15  20;  % x4
   20  15  10   5   0   5  10  15;  % x5
   25  20  15  10   5   0   5  10;  % x6
   30  25  20  15  10   5   0   5;  % x7
   35  30  25  20  15  10   5   0   % x8
];

disp('Матрица расстояний D (км):');
disp(D);

disp('Вектор весов P (абонентов):');
disp(P);

% ЗАДАЧА 1: Минимаксная задача (радиосеть)
% Находим max расстояние от каждой вершины к остальным
max_dist = max(D, [], 2);  % максимум по строкам
[minimax_value, minimax_node] = min(max_dist);

disp('--------------------------------------');
disp('Минимаксная задача (радиосеть)');
disp(['Минимальное значение максимальных расстояний: ', num2str(minimax_value), ' км']);
disp(['Рекомендуемая вершина для размещения узла радиодоступа: x', num2str(minimax_node)]);

% ЗАДАЧА 2: Минисуммная задача (кабельная сеть)
% Находим сумму произведений расстояний на количество абонентов
sum_weighted_dist = D * P';  % перемножаем матрицу D на вектор P
[minisum_value, minisum_node] = min(sum_weighted_dist);

disp('--------------------------------------');
disp('Минисуммная задача (кабельная сеть)');
disp(['Минимальная сумма расстояний с весами: ', num2str(minisum_value), ' абонентов * км']);
disp(['Рекомендуемая вершина для размещения узла кабельного доступа: x', num2str(minisum_node)]);

% Дополнительно выводим все суммы для анализа
disp('Суммы расстояний, взвешенные по количеству абонентов:');
for i = 1:length(sum_weighted_dist)
    fprintf('Вершина x%d: %f\n', i, sum_weighted_dist(i));
end