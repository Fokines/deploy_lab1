#include <iostream>
#include <cctype>

bool isPrime(int n) {
    if (n <= 1) {
        return false;
    }
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) {
            return false;
        }
    }
    return true;
}

int main() {
    int num;
    char input[50];
    bool isValidInput = false;

    while (!isValidInput) {
        std::cout << "Введите число для проверки на простоту: ";
        std::cin.getline(input, 50);

        isValidInput = true;
        for (int i = 0; input[i] != '\0'; i++) {
            if (!isdigit(input[i])) {
                isValidInput = false;
                break;
            }
        }

        if (!isValidInput) {
            std::cout << "Были введены не цифры. Пожалуйста, введите число снова." << std::endl;
        }
    }

    num = std::stoi(input);

    if (isPrime(num)) {
        std::cout << num << " является простым числом." << std::endl;
    } else {
        std::cout << num << " не является простым числом." << std::endl;
    }
    return 0;
}
