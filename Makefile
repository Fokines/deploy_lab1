# Компилятор
CC = g++
# Флаги компиляции
CFLAGS = -Wall -Wextra -std=c++11

# Имя исполняемого файла
TARGET = prime_checker

# Файлы исходного кода
SRCS = main.cpp

# Формирование имен объектных файлов
OBJS = $(SRCS:.cpp=.o)

# Правило по умолчанию
all: $(TARGET)

# Сборка исполняемого файла
$(TARGET): $(OBJS)
    $(CC) $(CFLAGS) $(OBJS) -o $(TARGET)

# Правило для компиляции каждого cpp файла
%.o: %.cpp
    $(CC) $(CFLAGS) -c $< -o $@

# Чистка
clean:
    $(RM) $(OBJS) $(TARGET)
