# Описание
Данный репозиторий содержит лабораторные работы по предмету «Реляционные базы данных» в 7 семестре

# Установка окружения

## Подготовка
* Загрузите образ [Oracle Database 21c Express Edition for Linux x64 (OL7)](https://www.oracle.com/database/technologies/xe-downloads.html);
* Установите [Docker](https://learn.microsoft.com/ru-ru/virtualization/windowscontainers/quick-start/set-up-environment?tabs=Windows-Server);
* Установите [Visual Studio Code](https://code.visualstudio.com/download);
* Загрузите расширение [Oracle Developer Tools for VS Code (SQL and PLSQL)](https://marketplace.visualstudio.com/items?itemName=Oracle.oracledevtools);

## Инструкция
1. Переместите загруженный образ в директорию [image](/Environment/image/) внутри [Environment](/Environment);
2. Откройте консоль в директории [Environment](/Environment);
3. В консоли выполните:
    ```sh
    build
    ```
4. Дождитесь завершения построения контейнера;
5. Добавьте соединение:
    ![Новое соединение](/Environment/.resources/oracle_developer_tools_create_connection.png)

    <span style="color:yellow">Пароль: Passw0rd</span>

P. S. [Dockerfile](/Environment/bin/Dockerfile) базируется на [данном репозитории](https://github.com/oracle/docker-images/tree/main/OracleDatabase/SingleInstance/dockerfiles/21.3.0)

# Задачи

## Задача 1
Сделать выборку из таблицы UNIVERSITY c использованием курсора и цикла с методом %FOUND или %NOTFOUND для получения данных об университетах с рейтингом большим 400 и с помощью пользовательской исключительной ситуации исключить из вывода данные об университетах, расположенных в интернете

## Задача 2
Описать и вызвать функцию, которая определяет для студентов с заданной фамилией сумму баллов по заданному предмету в таблице EXAMS

## Задача 3
Создать пакет, состоящий из функции с параметрами и процедуры без параметров. Функция подсчитывает количество студентов, учащихся в университете, заданным параметром. Процедура подсчитывает количество обращение к функции и заносит это количество, номер университета и количество студентов в новую таблицу, созданную заранее

## Задача 4
Создать триггер, который считает средний балл заданного студента и выдает диагностическое сообщение при превышении заданного порога уклонения вводимого значения атрибута в зависимости от среднего балла, при этом происходит заполнение некоторой таблицы

## Задача 5
Создать таблицу UNIVERSITY и заполнить ее с использованием последовательностей