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

# Имя deb пакета
DEB_PACKAGE = prime-checker

# Версия пакета
VERSION = 1.0

# Директория для установки файлов пакета
INSTALL_DIR = /usr/local/bin

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

#Создание deb пакета
deb:
	mkdir -p debian/$(DEB_PACKAGE)/DEBIAN
	echo "Package: $(DEB_PACKAGE)" > debian/$(DEB_PACKAGE)/DEBIAN/control
	echo "Version: $(VERSION)" >> debian/$(DEB_PACKAGE)/DEBIAN/control
	echo "Architecture: amd64" >> debian/$(DEB_PACKAGE)/DEBIAN/control
	echo "Maintainer: Anton & Egor & Kirill" >> debian/$(DEB_PACKAGE)/DEBIAN/control
	echo "Description: Description of the package" >> debian/$(DEB_PACKAGE)/DEBIAN/control
	mkdir -p debian/$(DEB_PACKAGE)/$(INSTALL_DIR)
	cp $(TARGET) debian/$(DEB_PACKAGE)/$(INSTALL_DIR)
	dpkg-deb --build debian/$(DEB_PACKAGE)

# Установка deb пакета
install:
	sudo dpkg -i debian/$(DEB_PACKAGE).deb

# Удаление deb пакета
uninstall:
	sudo dpkg -r $(DEB_PACKAGE)
